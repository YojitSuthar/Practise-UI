
import 'package:ecommerce/resources/resources.dart';
import 'package:flutter/material.dart';

// this is custom animation like button with Scale Translation animation
class AnimatedIconButton extends StatefulWidget {
  const AnimatedIconButton({Key? key}) : super(key: key);

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with TickerProviderStateMixin {
  late AnimationController iconController;
  bool colorRed = true;

  @override
  void initState() {
    iconController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 225),
        value: 1.0,
        upperBound: 1.4,
        lowerBound: 1.0);
    super.initState();
  }

  void _onTap() {
    iconController.forward().then((value) {
      iconController.reverse();
      setState(() {
        colorRed = !colorRed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _onTap,
      child: ScaleTransition(
        scale: iconController,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: colorRed?ColorManager.whiteColor:ColorManager.pinkColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: ScaleTransition(
              scale: iconController,
              child: colorRed
                  ?  Icon(Icons.favorite, size: 25,color: ColorManager.pinkColor,)
                  :  Icon(
                Icons.favorite,
                size: 25,
                color: ColorManager.whiteColor,
              )),
        ),
      ),
    );
  }
}