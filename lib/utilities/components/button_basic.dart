import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';

class ButtonBasic extends StatefulWidget {
  const ButtonBasic({super.key, this.onPressed, required this.text});

  final VoidCallback? onPressed;
  final String text;

  @override
  State<ButtonBasic> createState() => _ButtonBasicState();
}

class _ButtonBasicState extends State<ButtonBasic> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorProject.primaryColor,
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: fontSize.mediumLarger,
        ),
      ),
    );
  }
}
