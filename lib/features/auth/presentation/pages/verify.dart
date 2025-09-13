import 'package:flutter/material.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../core/widgets/text/custom_text.dart';
import '../widget/appBarFloating.dart';
import 'create_newPass_screen.dart';

class VerifyScreen extends StatefulWidget {
  static const String routeName = '/verify';
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}
class _VerifyScreenState extends State<VerifyScreen> {
  final List<TextEditingController> _otpControllers =
  List.generate(5, (_) => TextEditingController());

  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in _otpControllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarFloating("Verify Your Messages", CreateNewPassScreen.routeName),
            SizedBox(height: height * 0.03),
            Image.asset(
              "assets/images/Logo.png",
              height: height * 0.2,
              width: width * 0.4,
              fit: BoxFit.contain,
            ),
            SizedBox(height: height * 0.08),

            // OTP Input Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return SizedBox(
                  width: width * 0.12,
                  child: TextFormField(
                    controller: _otpControllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Palette.appColors.mainColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Palette.appColors.mainColor, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 4) {
                        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                      }
                    },
                    onTap: () {
                      _otpControllers[index].selection = TextSelection.fromPosition(
                        TextPosition(offset: _otpControllers[index].text.length),
                      );
                    },
                    onFieldSubmitted: (_) {
                      if (_otpControllers[index].text.isEmpty && index > 0) {
                        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                      }
                    },
                    onEditingComplete: () {}, // Disable default keyboard behavior

                  ),
                );
              }),
            ),

            SizedBox(height: height * 0.04),
            CustomText.s14(
              "Please enter the 6 digits code sent to 01094112497",
                  color: Palette.textColor.secondTextColor,
            ),
            SizedBox(height: height * 0.03),

            CustomButton(
              text: "Verify Code",
            onPressed: () {Navigator.pushNamed(context,CreateNewPassScreen.routeName);},
            ),
            TextButton(
              
            onPressed: () {Navigator.pushNamed(context,CreateNewPassScreen.routeName);},

              child: CustomText.s16(
                "Resend Code?",
                color: Palette.appColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
