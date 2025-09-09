import 'package:flutter/material.dart';

import '../../../../core/theme/palette.dart';
import '../../../../core/widgets/text/custom_text.dart';

class CustomRow extends StatelessWidget {
  final String text;
  final String routeNav;
  final String buttontext;
  const CustomRow(this.text, this.buttontext, this.routeNav, {super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText.s14(text, color: Palette.textColor.secondTextColor),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context,routeNav);
          },
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
          ),
          child: CustomText.s16(buttontext, color: Palette.appColors.mainColor),
        )
      ],
    );
  }
}
