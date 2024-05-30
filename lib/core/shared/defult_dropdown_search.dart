import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatefulWidget {
  const CustomDropDownSearch({
    Key? key,
    required this.title,
    required this.listdata,
    required this.dropdownSelectedName,
    required this.dropdownSelectedID,
    this.validator,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.disabled = false,
    required this.onSelected, // Define the callback function
  }) : super(key: key);

  final String title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownSelectedName;
  final TextEditingController dropdownSelectedID;
  final String? Function(String?)? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool disabled;
  final void Function(String name, String selectedValue)
      onSelected; // Callback function

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  void showDropDownSearch() {
    if (widget.disabled) return;
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'المتابعة',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropdownSelectedName.text = selectedListItem.name;
          widget.dropdownSelectedID.text = selectedListItem.value!;
          print("=========================");
          print(widget.dropdownSelectedName.text);
          print(widget.dropdownSelectedID.text);
          print("=========================");
          widget.onSelected!(
              selectedListItem.name, selectedListItem.value.toString());
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownSelectedName,
      cursorColor: Colors.black,
      validator: widget.validator,
      enabled:
          !widget.disabled, // Enable/disable based on the disabled property
      onTap: () {
        if (!widget.disabled) {
          FocusScope.of(context).unfocus();
          showDropDownSearch();
        }
      },
      decoration: InputDecoration(
        floatingLabelBehavior: widget.floatingLabelBehavior,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(widget.title)),
        hintText: widget.dropdownSelectedName.text == ""
            ? widget.title
            : widget.dropdownSelectedName.text,
        hintStyle: const TextStyle(fontSize: 14),
        suffixIcon: widget.disabled
            ? null
            : InkWell(
                onTap: () {
                  if (!widget.disabled) {
                    FocusScope.of(context).unfocus();
                    showDropDownSearch();
                  }
                },
                child: const Icon(Icons.arrow_drop_down),
              ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
