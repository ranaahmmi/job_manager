import 'package:flutter/material.dart';
import 'package:job_manager/helper/constants.dart';
import 'package:job_manager/helper/style.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class AppCustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Color? color;
  final Color textColor;
  final double fontSize;
  final double elevation;
  final bool isBoldTitle;
  final double? height;
  final Color shadowColor;
  final double? width;
  final double radius;

  const AppCustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.color,
    this.textColor = Colors.white,
    this.fontSize = 14.0,
    this.elevation = 0,
    this.isBoldTitle = true,
    this.height = 45,
    this.shadowColor = const Color(0xFF379DFF),
    this.width = double.infinity,
    this.radius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: title,
      color: color ?? AppColors.primaryColor,
      textColor: textColor,
      elevation: elevation,
      height: height,
      width: width,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      enableScaleAnimation: true,
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: isBoldTitle ? FontWeight.bold : FontWeight.normal,
        color: textColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      onTap: onPressed,
    );
  }
}

class AppCustomButtonWithChild extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? color;
  final double elevation;
  final double? height;
  final Color shadowColor;
  final double? width;
  final double radius;

  const AppCustomButtonWithChild({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color,
    this.elevation = 0,
    this.height = 45,
    this.shadowColor = const Color(0xFF379DFF),
    this.width,
    this.radius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      color: color ?? AppColors.primaryColor,
      elevation: elevation,
      height: height,
      width: width,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      enableScaleAnimation: true,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      onTap: onPressed,
      child: child,
    );
  }
}

class DashboardAnimationButton extends StatefulWidget {
  final VoidCallback onTab;
  final double width;
  final double height;
  final Color? color;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final bool? enableScaleAnimation;
  final String title;
  final String subTitle;
  final IconData icon;
  final Color iconColor;

  const DashboardAnimationButton({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.iconColor,
    required this.onTab,
    this.width = 156,
    this.height = 190,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.enableScaleAnimation,
  }) : super(key: key);

  @override
  DashboardAnimationButtonState createState() =>
      DashboardAnimationButtonState();
}

class DashboardAnimationButtonState extends State<DashboardAnimationButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  AnimationController? _controller;
  Color color = Colors.white;
  bool isDown = false;

  @override
  void initState() {
    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: appButtonScaleAnimationDurationGlobal ?? 50,
        ),
        lowerBound: 0.0,
        upperBound: 0.1,
      )..addListener(() {
          setState(() {});
        });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null) {
      _scale = 1 - _controller!.value;
    }

    if (widget.enableScaleAnimation
        .validate(value: enableAppButtonScaleAnimationGlobal)) {
      return Listener(
        onPointerDown: (details) {
          _controller?.forward();
          color = AppColors.primaryColor;
          isDown = true;
        },
        onPointerUp: (details) {
          _controller?.reverse();
          color = Colors.white;
          isDown = false;
        },
        child: Transform.scale(
          scale: _scale,
          child: buildButton(),
        ),
      );
    } else {
      return buildButton();
    }
  }

  Widget buildButton() {
    return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: color,
          boxShadow: [
            BoxShadow(
              color: const Color(0xffCAD0D9).withOpacity(0.5),
              offset: const Offset(4, 8),
              blurRadius: 20,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.icon,
                size: 23,
                color: widget.iconColor,
              )
                  .p(10)
                  .box
                  .roundedFull
                  .color(
                      isDown ? Colors.white : AppColors.grey.withOpacity(0.2))
                  .make(),
              defaultPadding,
              widget.subTitle.text
                  .color(isDown ? Colors.white : AppColors.grey)
                  .size(10)
                  .make(),
              5.heightBox,
              widget.title.text
                  .color(isDown ? Colors.white : Colors.black)
                  .bold
                  .size(14)
                  .make(),
            ],
          ),
        )).onTap(widget.onTab);
  }
}
