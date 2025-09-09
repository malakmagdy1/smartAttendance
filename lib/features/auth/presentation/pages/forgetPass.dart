import 'package:flutter/material.dart';
import 'package:test_salma/features/auth/presentation/pages/verify.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../core/widgets/customTextFormField/customTextformfield.dart';
import '../../../../../core/widgets/text/custom_text.dart';
import '../widget/appBarFloating.dart';

class ForgetPass extends StatefulWidget {
  static const String routeName = "/forgetPass";

  const ForgetPass({super.key});
  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final height = mediaQuery.height;
    final width = mediaQuery.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const AppBarFloating("Forget Password", VerifyScreen.routeName),
                SizedBox(height: height * 0.03),
                Image.asset(
                  "assets/images/Logo.png",
                  height: height * 0.2,
                  width: width * 0.4,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: height * 0.1),
                CustomText.s14(
                  "Enter your Phone Number which associated with your account to get verification code",
                  color: Palette.textColor.secondTextColor,
                ),
                SizedBox(height: height * 0.02),
                CustomTextFormField(
                  label: "Phone Number",
                  hintText: "Enter your number",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number is required";
                    } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                      return "Enter valid 11-digit number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.03),
                CustomButton(
                  text: "Send Code",
                  onPressed: () {Navigator.pushNamed(context,VerifyScreen.routeName);
                    // if (_formKey.currentState!.validate()) {
                    //   // Handle phone verification
                    // }
                  },
                ),
                SizedBox(height: height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
