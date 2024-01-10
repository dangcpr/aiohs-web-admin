import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/text_field.dart';
import 'package:flutter/material.dart';

class FilterLine extends StatefulWidget {
  const FilterLine(
      {super.key,
      required this.title,
      required this.info,
      this.isNumeric = true,
      this.validator,
      this.onTap,
      this.isReadOnly = false});

  final String title;
  final TextEditingController info;
  final bool isNumeric;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final bool isReadOnly;

  @override
  State<FilterLine> createState() => _FilterLineState();
}

class _FilterLineState extends State<FilterLine> {
  @override
  Widget build(BuildContext context) {
    return !Responsive.isMobile(context)
        ? SizedBox(
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: SelectableText(widget.title)),
                SizedBox(
                  width: 250,
                  child: TextFieldBasic(
                    controller: widget.info,
                    label: widget.title,
                    validator: widget.validator,
                    onTap: widget.onTap,
                    isReadOnly: widget.isReadOnly,
                  ),
                ),
              ],
            ),
          )
        : SizedBox(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(widget.title),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: TextFieldBasic(
                    controller: widget.info,
                    label: widget.title,
                    validator: widget.validator,
                    onTap: widget.onTap,
                    isReadOnly: widget.isReadOnly,
                  ),
                ),
              ],
            ),
          );
  }
}
