import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlinedButtonStyle1 extends StatelessWidget {
  const OutlinedButtonStyle1(
      {Key? key,
      this.borderColor,
      this.textColor,
      this.textStyle,
      this.borderWidth,
      this.onPressed,
      this.text,
      this.bgColor})
      : super(key: key);
  final Color? borderColor;
  final Color? bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? borderWidth;
  final dynamic onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: borderColor ?? Colors.grey,
              width: borderWidth ?? 2,
            ),
          ),
        ),
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Text(
            text ?? 'Another Link',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: textColor ?? Colors.grey[800],
            ),
          ),
        ),
      ),
    );
  }
}
