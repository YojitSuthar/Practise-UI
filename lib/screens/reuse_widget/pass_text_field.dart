import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class PassField extends StatefulWidget {
  TextEditingController textPassCtrl;
  String? label;
  PassField({required this.label, required this.textPassCtrl});
  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool obSure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5).r,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(30).w
      ),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            cursorColor: Colors.lightGreen,
            cursorRadius: Radius.circular(10),
            cursorWidth: 4,
            obscureText: obSure,
            controller: widget.textPassCtrl,
            decoration: InputDecoration(
                hintText: widget.label,
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10)),
          )),
          IconButton(
              onPressed: () {
                setState(() {
                  obSure = !obSure;
                });
              },
              icon: obSure
                  ? Icon(FluentSystemIcons.ic_fluent_eye_hide_filled)
                  : Icon(
                      FluentSystemIcons.ic_fluent_eye_show_filled,
                      color: Colors.grey[600],
                    ))
        ],
      ),
    );
  }
}
