import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth({
    super.key,
    required this.hintText,
    required this.lableText,
    this.iconData,
    required this.myController,
    this.isNumber = false,
    required this.validator,
    this.isPassword = false,
    this.onTapIcon,
    this.showPassword,
    this.suffixIcon,
    this.removePrefixIcon = false,
  });
  final String hintText;
  final String lableText;
  final IconData? iconData;
  final TextEditingController myController;
  final bool? isNumber;
  final String? Function(String?) validator;
  final bool? isPassword;
  final void Function()? onTapIcon;
  final bool? showPassword;
  final IconData? suffixIcon;
  final bool? removePrefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: isPassword == null || isPassword == false ? false : true,
        validator: validator,
        keyboardType: isNumber as bool
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        controller: myController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                      child: isPassword == true
                          ? const Icon(
                              Icons.visibility,
                              color: Color(0xFF9F9F9F),
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Color(0xFF9F9F9F),
                            ))
                  : null,
          prefixIcon: removePrefixIcon == true
              ? null
              : Icon(
                  iconData,
                  color: const Color(0xFF9F9F9F),
                ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
