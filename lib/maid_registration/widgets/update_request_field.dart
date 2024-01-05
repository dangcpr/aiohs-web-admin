import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/text_field.dart';
import 'package:flutter/material.dart';

class UpdateMaidRequestField extends StatefulWidget {
  const UpdateMaidRequestField({super.key, required this.reason});

  final TextEditingController reason;

  @override
  State<UpdateMaidRequestField> createState() => _UpdateMaidRequestFieldState();
}

class _UpdateMaidRequestFieldState extends State<UpdateMaidRequestField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Responsive.isDesktop(context)
          ? SizedBox(
              height: 85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: SelectableText("Lý do từ chối")),
                  SizedBox(width: 50),
                  SizedBox(
                    width: 250,
                    child: TextFieldBasic(
                      controller: widget.reason,
                      label: "Lý do từ chối",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Không được để trống';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText("Lý do từ chối"),
                SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: TextFieldBasic(
                    controller: widget.reason,
                    label: "Lý do từ chối",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Không được để trống';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
