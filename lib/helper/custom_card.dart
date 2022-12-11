import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomCard extends StatelessWidget {
  final Color? color;
  final Widget child;
  final double cornerRound;
  final bool isShadow;
  final bool isBorder;

  final double? height;
  final double? width;

  const CustomCard({
    Key? key,
    required this.child,
    this.cornerRound = 0,
    this.height,
    this.width,
    this.color,
    this.isShadow = false,
    this.isBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRound),
        color: context.isDarkMode ? context.cardColor : color ?? Colors.white,
        border: Border.all(
          color: isBorder
              ? const Color.fromARGB(22, 187, 185, 185)
              : Colors.transparent,
        ),
        boxShadow: [
          if (isShadow)
            const BoxShadow(
              color: Color.fromRGBO(183, 183, 183, 0.25),
              offset: Offset(0, 4),
              blurRadius: 10,
            )
          else
            const BoxShadow(color: Colors.transparent),
        ],
      ),
      child: child,
    );
  }
}
