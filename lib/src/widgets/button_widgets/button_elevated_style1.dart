import 'package:flutter/material.dart';
import 'package:randevu/src/style.dart';

class ButtonElevatedStyle1 extends StatelessWidget {
  const ButtonElevatedStyle1(
      {Key? key,
      this.icon,
      this.text,
      this.bgColor,
      this.textColor,
      this.onPressed})
      : super(key: key);
  final IconData? icon;
  final String? text;
  final Color? bgColor;
  final Color? textColor;
  final dynamic? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: bgColor,
          ),
          icon: Icon(
            icon ?? Icons.wb_incandescent_outlined,
            size: 26,
            color: textColor,
          ),
          label: Text(
            text ?? 'Button',
            style: TextStyle(fontSize: 16, color: textColor ?? Colors.white),
          )),
    );
  }
}
