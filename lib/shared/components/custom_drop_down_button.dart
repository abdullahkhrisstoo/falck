import 'package:flutter/material.dart';

class CustomDropDownComponent extends StatelessWidget {
  final List<String> dropDownList;
  final String? selectedItem;
  final String hint;
  final String label;
  final ValueChanged<String?>? onChanged;

  const CustomDropDownComponent({
    super.key,
    required this.dropDownList,
    this.selectedItem,
    this.onChanged,
    required this.hint,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      DropdownButtonFormField<String>(
          value: selectedItem,
          hint: Text(hint),
          items: dropDownList.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged)
    ]);
  }
}
