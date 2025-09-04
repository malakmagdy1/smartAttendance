// ignore_for_file: unused_field, unused_element

import 'package:flutter/material.dart';

class Palette {
  const Palette();

  // App Colors
  static final appColors = _AppColors();

  // Text Colors
  static final textColor = _TextColor();

  // Neutral Colors
  static final neutral = _NeutralColors();

  // L G
  static final lightGray = _LG();
}

class _AppColors {
  final Color mainColor;
  final Color secondaryColor;
  final Color lightTextBackground;
  final Color errorColor;

  _AppColors({
    this.mainColor = const Color(0xff395486),
    this.secondaryColor = const Color(0xff85684D),
    this.lightTextBackground = const Color(0xffF4F4F4),
    this.errorColor = const Color(0xffD80000),
  });
}

class _TextColor {
  final Color mainTextColor;
  final Color secondTextColor;

  _TextColor({
    this.mainTextColor = const Color(0xff070707),
    this.secondTextColor = const Color(0xff606060),
  });
}

class _NeutralColors {
  final  Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  final Color color6;
  final Color color7;
  final Color color8;
  final Color color9;
  final Color color10;
  final Color color11;
  final Color color12;
  final Color color13;

  _NeutralColors({
    this.color1 = const Color(0xffffffff),
    this.color2 = const Color(0xfffafafa),
    this.color3 = const Color(0xfff5f5f5),
    this.color4 = const Color(0xfff0f0f0),
    this.color5 = const Color(0xffd9d9d9),
    this.color6 = const Color(0xffbfbfbf),
    this.color7 = const Color(0xff8c8c8c),
    this.color8 = const Color(0xff595959),
    this.color9 = const Color(0xff434343),
    this.color10 = const Color(0xff262626),
    this.color11 = const Color(0xff1f1f1f),
    this.color12 = const Color(0xff141414),
    this.color13 = const Color(0xff000000),
  });
}

class _LG {
  final Color lightGray;

  _LG({
    this.lightGray = const Color(0xffA8A8A8),
  });
}
