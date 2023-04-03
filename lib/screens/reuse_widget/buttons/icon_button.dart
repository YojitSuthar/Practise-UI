import 'package:flutter/material.dart';

class IcnButton extends StatelessWidget {
  IcnButton({
    super.key,
    required this.onPressed,
    required this.iconSize,
    required this.child,
  });

  final VoidCallback? onPressed;
  double iconSize;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        iconSize: iconSize,
        onPressed: onPressed,
        icon: child);
  }
}