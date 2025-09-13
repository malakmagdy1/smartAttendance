import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_salma/core/theme/palette.dart';

import '../../../../../core/widgets/text/custom_text.dart';

class NotifiWidget extends StatelessWidget {
  final String title;
  final String trailText;
  final String imagePath;

  NotifiWidget({
    required this.title,
    required this.imagePath,
    required this.trailText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 20,
        right: 10,
        bottom: 10,
      ),
      child: Container(
        height: 90, // adjust height
        width: double.infinity, // or a fixed width if you want
        decoration: BoxDecoration(
          color: Color(0xFFA0BFEB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // match container radius
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          subtitle: CustomText.s16(title, bold: true, color: Colors.black),
          trailing: CustomText.s14(trailText, bold: true, color: Colors.black),
          leading: SvgPicture.asset(
            imagePath,
            height: 30, // you can control svg size too
            width: 30,
            color: Palette.appColors.mainColor,
          ),
        ),
      ),
    );
  }
}
