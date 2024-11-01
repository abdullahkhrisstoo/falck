import 'package:falack_app/core/font/font_size.dart';
import 'package:falack_app/core/font/fonts.dart';
import 'package:flutter/material.dart';

class DynamicRadioButton<T> extends StatelessWidget {
  final List<T> options;
  final T selectedOption;
  final void Function(T?)? onChanged;
  const DynamicRadioButton(
      {super.key,
      required this.options,
      required this.selectedOption,
      required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Column(
        children: options.map((option) {
      return RadioListTile<T>(
          controlAffinity: ListTileControlAffinity.trailing, 
          value: option,
          groupValue: selectedOption,
          onChanged: onChanged,
          title: Text(option.toString(),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: FontsSize.s14,
                  fontWeight: Fonts.semiBold)));
    }).toList());
  }
}

// todo: EXAMPLE
// List<String> name = ['male', 'female', 'other'];

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
  // String selectedGender = name[0];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: const Text('Dynamic Radio Button')),
//             body: Column(children: [
              // DynamicRadioButton<String>(
              //     options: name,
              //     selectedOption: selectedGender,
              //     onChanged: (value) {
              //       setState(() {
              //         selectedGender = value!;
              //       });
              //     }),
//               const SizedBox(height: 16.0),
//               Text(
//                   'Selected Gender: ${selectedGender.toString().split('.').last}',
//                   style: const TextStyle(fontSize: 16.0))
//             ])));
//   }
// }
