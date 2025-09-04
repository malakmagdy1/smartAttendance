import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/extensions.dart';
import 'palette.dart';

class AppTheme {
  AppTheme();

  late final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Palette.appColors.mainColor,
      secondary: Palette.appColors.secondaryColor,
      error: Palette.appColors.errorColor,
      shadow: Palette.neutral.color1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsetsDirectional.symmetric(
        vertical: 9.h,
        horizontal: 16.w,
      ),
      hintStyle: TextStyle(
        fontSize: 14.sp,
        color: Palette.textColor.secondTextColor,
        fontWeight: FontWeight.w400,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Palette.neutral.color5),
        borderRadius: 11.borderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Palette.appColors.mainColor),
        borderRadius: 11.borderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Palette.appColors.errorColor, width: 2),
        borderRadius: 11.borderRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Palette.appColors.errorColor, width: 3),
        borderRadius: 11.borderRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Palette.neutral.color2),
        borderRadius: 11.borderRadius,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Palette.neutral.color5),
        borderRadius: 11.borderRadius,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        maximumSize: WidgetStateProperty.all(Size.fromHeight(48.h)),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 8.w,
        )),
        shape: WidgetStateProperty.all(8.roundedBorder),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        maximumSize: WidgetStateProperty.all(Size.fromHeight(48.h)),
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 8.w,
        )),
        shape: WidgetStateProperty.all(8.roundedBorder),
      ),
    ),
    appBarTheme: AppBarTheme(
      shadowColor: Palette.neutral.color1,
      surfaceTintColor: Palette.neutral.color1,
      backgroundColor: Palette.neutral.color1,
      iconTheme: IconThemeData(color: Palette.neutral.color13),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
        color: Palette.neutral.color13,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
        color: Palette.neutral.color5,
      ),
    ),
  );
}
