import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'dart:convert';

import 'package:falack_app/shared/text_from_feaild/text_form_feild.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  List<LatLng> _routePoints = [];
  LatLng startPoint = const LatLng(52.5200, 13.4050); // Berlin
  LatLng endPoint = const LatLng(48.8566, 2.3522); // Paris
  LatLng? _currentSearchLocation;
  List<String> _searchSuggestions = [];
  IconData _selectedIcon = Icons.location_on;
  LatLng? _from;
  LatLng? _to;
  Timer? _timer;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _fromController.addListener(() {
      final query = _fromController.text;
      if (query.length >= 5) {
        _fetchSuggestions(query);
      } else {
        setState(() {
          _searchSuggestions = [];
        });
      }
    });
    _toController.addListener(() {
      final query = _toController.text;
      if (query.length >= 5) {
        _fetchSuggestions(query);
      } else {
        setState(() {
          _searchSuggestions = [];
        });
      }
    });
    _getRoute();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      setState(() {
        _counter++;
        log(_counter.toString());
        _from = _from == null || _from?.latitude == null
            ? startPoint
            : LatLng(_from!.latitude + 1, _from!.longitude + 1);
        // _getRoute();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _getRoute() async {
    const String apiKey =
        '5b3ce3597851110001cf6248845412c958dd4830b6765e45d3677e0b';
    final String url =
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKey&start=${_from?.longitude},${_from?.latitude}&end=${_to?.longitude},${_to?.latitude}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      log(data.toString());
      final List<dynamic> coordinates =
          data['features'][0]['geometry']['coordinates'];

      setState(() {
        _routePoints =
            coordinates.map((point) => LatLng(point[1], point[0])).toList();
      });
    } else {
      log('Failed to load route');
    }
  }

  void _zoomIn() {
    _mapController.move(_mapController.center, _mapController.zoom + 1);
  }

  void _zoomOut() {
    _mapController.move(_mapController.center, _mapController.zoom - 1);
  }

  Future<void> _fetchSuggestions(String query) async {
    const String apiKey =
        '5b3ce3597851110001cf6248845412c958dd4830b6765e45d3677e0b';
    final String url =
        'https://api.openrouteservice.org/geocode/autocomplete?api_key=$apiKey&text=$query';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> suggestions = data['features'] as List<dynamic>;

      setState(() {
        _searchSuggestions = suggestions
            .map((dynamic suggestion) => (suggestion['properties']
                as Map<String, dynamic>)['label'] as String)
            .toList();
      });
    } else {
      log('Failed to fetch suggestions');
    }
  }

  Future<void> _searchLocation(String query,
      {bool fromSuggestion = false}) async {
    const String apiKey =
        '5b3ce3597851110001cf6248845412c958dd4830b6765e45d3677e0b';
    final String url =
        'https://api.openrouteservice.org/geocode/search?api_key=$apiKey&text=$query';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['features'].isNotEmpty) {
        final double lat = data['features'][0]['geometry']['coordinates'][1];
        final double lon = data['features'][0]['geometry']['coordinates'][0];
        setState(() {
          _currentSearchLocation = LatLng(lat, lon);
          _mapController.move(_currentSearchLocation!,
              14.0); // Move to searched location with zoom level 14
          if (fromSuggestion) {
            _selectedIcon = Icons.location_on;
          }
        });
      } else {
        log('No results found');
      }
    } else {
      log('Failed to load location');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          TextF(
              controller: _fromController,
              hintText: 'Search location...',
              onFieldSubmitted: (value) {
                _searchLocation(value);
                _from = LatLng(_currentSearchLocation!.latitude,
                    _currentSearchLocation!.longitude);
              }),
          TextF(
              controller: _toController,
              hintText: 'to...',
              onFieldSubmitted: (value) {
                _searchLocation(value);
                _searchSuggestions = [];
                _to = LatLng(_currentSearchLocation!.latitude,
                    _currentSearchLocation!.longitude);
                log("To: $_to");
                _getRoute();
              }),
          if (_searchSuggestions.isNotEmpty)
            ListView.builder(
                shrinkWrap: true,
                itemCount: _searchSuggestions.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      child: Text(_searchSuggestions[index]),
                      onTap: () {
                        _searchLocation(_searchSuggestions[index],
                            fromSuggestion: true);
                      });
                }),
          SizedBox(
              height: 500,
              child: Stack(children: [
                FlutterMap(
                    mapController: _mapController,
                    options:
                        const MapOptions(center: LatLng(50.0, 10.0), zoom: 5.0),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      PolylineLayer(polylines: [
                        Polyline(
                            points: _routePoints,
                            strokeWidth: 4.0,
                            color: Colors.blue)
                      ]),
                      MarkerLayer(markers: [
                        Marker(
                            width: 80.0,
                            height: 80.0,
                            point: _from ?? startPoint,
                            child: const Icon(Icons.location_on,
                                color: Colors.red, size: 40)),
                        Marker(
                            width: 80.0,
                            height: 80.0,
                            point: _to ?? startPoint,
                            child: const Icon(Icons.location_on,
                                color: Colors.green, size: 40)),
                        // if (_currentSearchLocation != null)
                        //   Marker(
                        //     width: 80.0,
                        //     height: 80.0,
                        //     point: _currentSearchLocation!,
                        //     child: Icon(
                        //       _selectedIcon,
                        //       color: Colors.blue,
                        //       size: 40,
                        //     ),
                        //   ),
                      ])
                    ]),
                Positioned(
                    right: 10,
                    top: 10,
                    child: Column(children: [
                      FloatingActionButton(
                          heroTag: "zoomIn",
                          mini: true,
                          backgroundColor: Colors.blue,
                          onPressed: _zoomIn,
                          child: const Icon(Icons.zoom_in)),
                      const SizedBox(height: 8),
                      FloatingActionButton(
                          heroTag: "zoomOut",
                          mini: true,
                          backgroundColor: Colors.blue,
                          onPressed: _zoomOut,
                          child: const Icon(Icons.zoom_out))
                    ]))
              ]))
        ]));
  }
}
