
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/theme/palette.dart';
import '../../../core/widgets/buttons/custom_button.dart';
import '../../../core/widgets/text/custom_text.dart';
import '../../auth/presentation/pages/SignUpScreen.dart';

class OnboardingData extends StatelessWidget {
  final String? title;
  final String? text;
  final String imagePath;
  final bool? backIcon;
  final bool? skip;
  final VoidCallback next;
  final VoidCallback? backnav;
  final String buttonText; 


  const OnboardingData({super.key, 
    required this.next,
    required this.title,
    required this.text,
    required this.imagePath,
    this.backIcon = false,
    this.skip = false,
     this.backnav,
    required this.buttonText, 


  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,

       leading: backIcon == true
    ? IconButton(
        onPressed: backnav,
        icon: SvgPicture.asset(
          "assets/icons/weui_back-filled.svg",
           width: 24, 
          height: 24,
          color: Colors.white,
        ),
      )
    : null,

        actions: [
          if (skip == true)
            TextButton(
              onPressed: () => Navigator.pushNamed(context,SignUpscreen.routeName) ,
              child: CustomText.s16("Skip", color: Colors.white),
            ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: mediaQuery.height*0.7,
            child: Container(
              height: mediaQuery.height*0.35,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText.s24(title, bold: true),
                    CustomText.s14(
                      text,
                      color: Palette.textColor.secondTextColor,
                    ),
                    CustomButton(text: buttonText, onPressed: next),SizedBox(height:mediaQuery.height*0.05),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class OnboardingItem {
  final String title;
  final String text;
  final String imagePath;
  final bool backIcon;
  final bool skip;
  final VoidCallback next;
  final VoidCallback? backnav;
  final String buttonText;


  OnboardingItem({
    required this.next,
    required this.title,
    required this.text,
    required this.imagePath,
    this.backIcon = false,
    this.skip = false,
    this.backnav,
      required this.buttonText, 

  });
}
