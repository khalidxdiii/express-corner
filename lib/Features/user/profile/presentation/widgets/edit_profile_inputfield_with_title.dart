import 'package:flutter/material.dart';

import '../../../../../core/shared/defult_textformfield.dart';

class EditProfileInputFieldWithTitle extends StatelessWidget {
  const EditProfileInputFieldWithTitle(
      {super.key,
      required this.title,
      required this.controller,
      required this.validator,
      this.isPassword = false,
      this.onTapIcon,
      this.isHideSuffixIcon = true,
      this.iconData = Icons.person,
      this.suffixIcon,
      this.showPassword,
      this.removePrefixIcon = false,
      this.hintText,
      required this.titleText,
      this.maxLines});
  final String title;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool? isPassword;
  final Function()? onTapIcon;
  final bool? isHideSuffixIcon;
  final IconData? iconData;
  final IconData? suffixIcon;
  final bool? removePrefixIcon;
  final bool? showPassword;
  final String? hintText;
  final String titleText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        CustomDefultTextForm(
          maxLines: maxLines,
          isPassword: isPassword,
          suffixIcon: suffixIcon,
          removePrefixIcon: removePrefixIcon,
          showPassword: showPassword,
          onTapIcon: onTapIcon,
          hintText: hintText.toString(),
          lableText: titleText,
          iconData: Icons.person,
          isHideSuffixIcon: isHideSuffixIcon,
          myController: controller,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          validator: validator,
        ),
      ],
    );
  }
}
