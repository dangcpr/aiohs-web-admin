import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/user_manage/constants/user_manage.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';

class FilterLineChoiceRole extends StatefulWidget {
  const FilterLineChoiceRole(
      {super.key, required this.title, required this.info});

  final String title;
  final TextEditingController info;

  @override
  State<FilterLineChoiceRole> createState() => _FilterLineChoiceRoleState();
}

class _FilterLineChoiceRoleState extends State<FilterLineChoiceRole> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return !Responsive.isMobile(context)
        ? SizedBox(
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: SelectableText(widget.title)),
                Wrap(
                  spacing: 6.0,
                  children: List<Widget>.generate(
                    roles.length,
                    (int index) {
                      return ChoiceChip(
                        label: Text(roles[index].name),
                        selected: _value == index,
                        selectedColor: MaterialStateColor.resolveWith(
                            (states) =>
                                colorProject.primaryColor.withOpacity(0.4)),
                        onSelected: (bool selected) {
                          widget.info.text = roles[index].code;
                          setState(() {
                            _value = selected ? index : 0;
                          });
                        },
                      );
                    },
                  ).toList(),
                )
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
                Container(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 6.0,
                    //alignment: WrapAlignment.spaceBetween,
                    children: List<Widget>.generate(
                      roles.length,
                      (int index) {
                        return ChoiceChip(
                          label: Text(roles[index].name),
                          selected: _value == index,
                          selectedColor: MaterialStateColor.resolveWith(
                              (states) =>
                                  colorProject.primaryColor.withOpacity(0.4)),
                          onSelected: (bool selected) {
                            widget.info.text = roles[index].code;
                            setState(() {
                              _value = selected ? index : 0;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          );
  }
}
