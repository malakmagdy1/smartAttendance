import 'package:flutter/material.dart';
import 'package:test_salma/core/theme/palette.dart';

class Custombuttonicon extends StatelessWidget {
  const Custombuttonicon({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 80.0, right: 80, bottom: 20),
        child: Icon(Icons.check, size: 30, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Palette.appColors.mainColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
