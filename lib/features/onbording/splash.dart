import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/theme/palette.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
          () {
      Navigator.pushNamed(context, Onboarding.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.appColors.mainColor,
      body: Center(
        child: Image.asset("assets/images/Logo+Name.png",color: Colors.white,),
      ),
    );
  }
}
