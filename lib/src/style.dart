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
