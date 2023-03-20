import 'package:flutter/material.dart';


class PassField extends StatefulWidget {

  TextEditingController textPassCtrl;
  String ?label;
  PassField({required this.label,required this.textPassCtrl});

  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool obSure=true;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
                  obscureText: obSure,
                  controller: widget.textPassCtrl,
                  decoration: InputDecoration(hintText: widget.label,border: InputBorder.none,contentPadding: EdgeInsets.only(left: 10)),
                )),
            IconButton(onPressed: (){
              setState(() {
                obSure=!obSure;
              });
            }, icon: Icon(Icons.remove_red_eye_outlined))
          ],
        ),
      ),
    );
  }
}
