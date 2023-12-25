import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';

class TextFieldBasic extends StatefulWidget {
  const TextFieldBasic(
      {super.key,
      required this.controller,
      required this.label,
      required this.icon,
      this.obscureText,
      this.validator});

  final TextEditingController controller;
  final String label;
  final Widget icon;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  State<TextFieldBasic> createState() => _TextFieldBasicState();
}

class _TextFieldBasicState extends State<TextFieldBasic> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: isDark ? Colors.white : Colors.black.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: colorProject.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        prefixIcon: widget.icon,
      ),
      cursorColor: colorProject.primaryColor,
      validator: widget.validator,
    );
  }
}
