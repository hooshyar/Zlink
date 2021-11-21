import 'package:flutter/material.dart';

MaterialColor convertToMaterialColor(Color theColor) {
  final MaterialColor mainColor = MaterialColor(theColor.value, <int, Color>{
    50: theColor.withOpacity(0.05),
    100: theColor.withOpacity(0.1),
    200: theColor.withOpacity(0.2),
    300: theColor.withOpacity(0.3),
    400: theColor.withOpacity(0.4),
    500: theColor.withOpacity(0.5),
    600: theColor.withOpacity(0.6),
    700: theColor.withOpacity(0.7),
    800: theColor.withOpacity(0.8),
    900: theColor.withOpacity(0.9),
  });
  return mainColor;
}

final MaterialColor mainColor =
    MaterialColor(const Color(0xFF109D7B).value, const <int, Color>{
  50: Color(0xFF109D7B),
  100: Color(0xFF109D7B),
  200: Color(0xFF109D7B),
  300: Color(0xFF109D7B),
  400: Color(0xFF109D7B),
  500: Color(0xFF109D7B),
  600: Color(0xFF109D7B),
  700: Color(0xFF109D7B),
  800: Color(0xFF109D7B),
  900: Color(0xFF109D7B),
});

InputDecoration generalTextDecoration(
    {required String labelText, String? prefixText, String? hintText}) {
  return InputDecoration(
    hintText: hintText,

    labelText: labelText,
    prefix: prefixText == null ? null : Text(prefixText),
    // hintText: '751 449 1008',
    prefixStyle: prefixText == null
        ? null
        : const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
    filled: true,

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        color: Colors.grey[300]!,
        width: 1,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        color: Colors.grey[100]!,
      ),
    ),
  );
}

InputDecoration bottomTextDecoration(
    {required String labelText, String? prefixText, String? hintText}) {
  return InputDecoration(
    hintText: hintText,

    labelText: labelText,
    prefix: prefixText == null ? null : Text(prefixText),
    // hintText: '751 449 1008',
    prefixStyle: prefixText == null
        ? null
        : const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
    // filled: true,

    // enabledBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(6),
    //   borderSide: BorderSide(
    //     color: Colors.grey[300]!,
    //     width: 1,
    //   ),
    // ),
    // border: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(6),
    //   borderSide: BorderSide(
    //     color: Colors.grey[100]!,
    //   ),
    // ),
  );
}
