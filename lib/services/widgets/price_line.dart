import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/text_field.dart';
import 'package:flutter/material.dart';

class PriceLine extends StatefulWidget {
  const PriceLine({super.key, required this.title, required this.price, this.isNumeric = true});

  final String title;
  final TextEditingController price;
  final bool isNumeric;

  @override
  State<PriceLine> createState() => _PriceLineState();
}

class _PriceLineState extends State<PriceLine> {
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
                    controller: widget.price,
                    label: widget.title,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Không được để trống';
                      }
                      if (int.tryParse(value) == null && widget.isNumeric) {
                        return 'Vui lòng nhập số nguyên';
                      }
                      return null;
                    },
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
                    controller: widget.price,
                    label: widget.title,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Không được để trống';
                      }
                      if (int.tryParse(value) == null && widget.isNumeric) {
                        return 'Vui lòng nhập số nguyên';
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
