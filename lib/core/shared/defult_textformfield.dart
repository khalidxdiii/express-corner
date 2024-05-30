import 'package:flutter/material.dart';

class CustomDefultTextForm extends StatelessWidget {
  const CustomDefultTextForm({
    Key? key,
    required this.hintText,
    required this.lableText,
    required this.iconData,
    required this.myController,
    this.isNumber = false,
    this.validator,
    this.isPassword = false,
    this.onTapIcon,
    this.isHideSuffixIcon = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.showPassword,
    this.suffixIcon,
    this.removePrefixIcon = false,
    this.maxLines,
    this.disableValidator = false,
    this.onChanged,
    this.isReadOnly = false,
  }) : super(key: key);

  final String hintText;
  final String lableText;
  final IconData iconData;
  final TextEditingController myController;
  final bool? isNumber;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final void Function()? onTapIcon;
  final bool? isHideSuffixIcon;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? showPassword;
  final IconData? suffixIcon;
  final bool? removePrefixIcon;
  final int? maxLines;
  final bool? disableValidator;
  final void Function(String)? onChanged;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: isReadOnly ? Colors.grey[200] : null,
      child: TextFormField(
        readOnly: isReadOnly,
        obscureText: isPassword == null || isPassword == false ? false : true,
        validator: disableValidator == false ? validator : null,
        onChanged: onChanged,
        keyboardType: isNumber as bool
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        controller: myController,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          floatingLabelBehavior: floatingLabelBehavior,
          contentPadding: removePrefixIcon == true
              ? const EdgeInsets.symmetric(vertical: 5, horizontal: 10)
              : const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(lableText)),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          suffixIcon:
              suffixIcon != null || showPassword == true || isPassword == true
                  ? InkWell(
                      onTap: onTapIcon,
                      child: suffixIcon != null
                          ? Icon(suffixIcon)
                          : isPassword == true
                              ? const Icon(
                                  Icons.visibility,
                                  color: Color(0xFF9F9F9F),
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Color(0xFF9F9F9F),
                                ))
                  : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
