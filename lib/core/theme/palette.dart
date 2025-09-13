// ignore_for_file: unused_field, unused_element

import 'package:flutter/material.dart';

class Palette {
  const Palette();

  // App Colors
  static const appColors = _AppColors();

  // Text Colors
  static final textColor = _TextColor();

  // Neutral Colors
  static const neutral = _NeutralColors();

  // L G
  static const lightGray = _LG();
}
class _AppColors {
  final Color mainColor = const Color(0xFF395886);
  final Color secondaryColor = const Color(0xFF03DAC6);
  final Color lightTextBackground = const Color(0xFFF5F5F5);
  final Color errorColor = const Color(0xFFB00020);

  const _AppColors();
}

class _TextColor {
  final Color mainTextColor = Colors.black;
  final Color secondTextColor = Color(0xFF737373);
  final Color thirdTextColor = Colors.grey.shade400;

  _TextColor();
}

class _NeutralColors {
  final Color color1 = Colors.white;
  final Color color2 = Colors.black;
  final Color color3 = Colors.grey;
  final Color color4 = Colors.red;
  final Color color5 = Colors.green;
  final Color color6 = Colors.blue;
  final Color color7 = Colors.orange;
  final Color color8 = Colors.purple;
  final Color color9 = Colors.brown;
  final Color color10 = Colors.teal;
  final Color color11 = Colors.cyan;
  final Color color12 = Colors.amber;
  final Color color13 = Colors.indigo;

  const _NeutralColors();
}

class _LG {
  final Color lightGray = const Color(0xFFEEEEEE);

  const _LG();
}
