import 'package:cached_network_image/cached_network_image.dart';
import 'package:falack_app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;

  // List of widgets to display based on the selected tab
  final List<Widget> _widgetOptions = const <Widget>[
    Center(child: Text('0', style: TextStyle(fontSize: 24))),
    Center(child: Text('1', style: TextStyle(fontSize: 24))),
    Center(child: Text('2', style: TextStyle(fontSize: 24))),
    Center(child: Text('3', style: TextStyle(fontSize: 24))),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 1,
        selectedFontSize: 1,
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '', // No label
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '', // No label
          ),
          BottomNavigationBarItem(
            icon: FloatingActionButton.small(
              shape: const CircleBorder(),
              onPressed: () {},
              child: const Icon(Icons.add),
            ), // No space
            label: '', // No label
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '', // No label
          ),
           BottomNavigationBarItem(
            icon: Stack(
              children: [
                const CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                      'https://img.freepik.com/free-vector/hand-drawn-nft-style-ape-illustration_23-2149622021.jpg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 9,
                    child: Icon(
                      size: 16,
                      color:Theme.of(context).colorScheme.onPrimary,
                      Icons.menu)))
              ],
            ),
            label: '', // No label
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
