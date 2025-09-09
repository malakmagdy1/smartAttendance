import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/text/custom_text.dart';

class AppBarFloating extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String pageNav;

  const AppBarFloating(this.title, this.pageNav, {super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: mediaQuery.height * 0.1, // Responsive height (10% of screen)
      title: CustomText.s20(
        title,
        color: Palette.appColors.mainColor,
        bold: true,
      ),
      leading: Padding(
        padding: EdgeInsets.all(mediaQuery.width * 0.02), // Responsive padding
        child: FloatingActionButton.small(
          onPressed: () {
           Navigator.pushNamed(context, pageNav);
          },
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          child: SvgPicture.asset(
            "assets/icons/weui_back-filled.svg",
            width: 24,
            height: 24,
            color: Palette.appColors.mainColor, // غيّرت اللون عشان يبان
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80); // Default fixed height
}
