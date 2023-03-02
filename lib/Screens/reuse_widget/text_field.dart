import 'package:flutter/material.dart';


class NTextField extends StatelessWidget {

  TextEditingController textCtrl;
  String ?label;

  NTextField({required this.textCtrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        child: Expanded(
            child: TextFormField(
              controller: textCtrl,
              decoration: InputDecoration(hintText: label,border: InputBorder.none,contentPadding: EdgeInsets.only(left: 10)),
            )),
      ),
    );
  }
}
