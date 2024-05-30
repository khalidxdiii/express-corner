import 'package:flutter/material.dart';

class DefultDropdownMenu extends StatelessWidget {
  const DefultDropdownMenu({
    Key? key,
    this.width,
    required this.title,
    required this.lable,
    required this.controller,
    required this.hintText,
    required this.onSelected,
    required this.dropdownMenuEntries,
    this.enableFilter = false,
    this.enableSearch = true,
    this.isDisabled = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.never,
  }) : super(key: key);

  final double? width;
  final String title;
  final String lable;
  final bool? enableFilter;
  final bool? enableSearch;
  final bool isDisabled;
  final TextEditingController controller;
  final String hintText;
  final void Function(dynamic) onSelected;
  final List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 10),
        ),
        const SizedBox(height: 10),
        Container(
          color: isDisabled
              ? Colors.grey[100]
              : null, // Set gray color if disabled
          child: IgnorePointer(
            ignoring: isDisabled,
            child: DropdownMenu(
              width: width,
              label: Text(
                lable,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              enableFilter: enableFilter!,
              enableSearch: enableSearch!,
              controller: controller,
              hintText: hintText,
              inputDecorationTheme: InputDecorationTheme(
                floatingLabelBehavior: floatingLabelBehavior!,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSelected: onSelected,
              dropdownMenuEntries: dropdownMenuEntries,
            ),
          ),
        ),
      ],
    );
  }
}
