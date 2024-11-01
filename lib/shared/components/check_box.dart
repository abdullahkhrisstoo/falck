import 'package:flutter/material.dart';

class DynamicCheckboxList<T> extends StatefulWidget {
  final List<T> options;
  final List<T> selectedOptions;
  final void Function(List<T>)? onChanged;

  const DynamicCheckboxList({
    super.key,
    required this.options,
    required this.selectedOptions,
    this.onChanged,
  });

  @override
  DynamicCheckboxListState<T> createState() => DynamicCheckboxListState<T>();
}

class DynamicCheckboxListState<T> extends State<DynamicCheckboxList<T>> {
  late List<T> _selectedOptions;

  @override
  void initState() {
    super.initState();
    _selectedOptions = List.from(widget.selectedOptions);
  }

  void _handleOptionChanged(T option, bool isChecked) {
    setState(() {
      if (isChecked) {
        if (!_selectedOptions.contains(option)) {
          _selectedOptions.add(option);
        }
      } else {
        _selectedOptions.remove(option);
      }
    });

    widget.onChanged?.call(_selectedOptions);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.options.map((option) {
        return CheckboxListTile(
          value: _selectedOptions.contains(option),
          onChanged: (isChecked) {
            _handleOptionChanged(option, isChecked ?? false);
          },
          title: Text(option.toString()),
        );
      }).toList(),
    );
  }
}

// Example usage
// List<String> fruits = ['Apple', 'Banana', 'Orange'];

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<String> selectedFruits = [];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Dynamic Checkbox List')),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
              // DynamicCheckboxList<String>(
              //   options: fruits,
              //   selectedOptions: selectedFruits,
              //   onChanged: (List<String> selectedOptions) {
              //     setState(() {
              //       selectedFruits = selectedOptions;
              //     });
              //   },
              // ),
//               const SizedBox(height: 16.0),
//               Text(
//                 'Selected Fruits: ${selectedFruits.join(", ")}',
//                 style: const TextStyle(fontSize: 16.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
