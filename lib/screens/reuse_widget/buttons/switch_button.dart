import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  SwitchButton({
    super.key,
    required this.label,
    required this.value,
  });

  String label;
  bool value;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        activeColor: Colors.black,
        thumbColor: Colors.white,
        trackColor: Colors.black12,
        value:value,
        onChanged: (value){},
      ),
    );
  }
}
