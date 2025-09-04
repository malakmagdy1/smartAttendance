import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart/features/home/presentation/home/presentation/home_screen.dart';
import 'package:smart/features/home/presentation/home/presentation/navBar.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../core/widgets/customTextFormField/customTextformfield.dart';
import '../../../../../core/widgets/text/custom_text.dart';
import '../widget/customrow.dart';
import 'SignUpScreen.dart';
import 'create_newPass_screen.dart';
import 'forgetPass.dart';

class SignInscreen extends StatefulWidget {
  static const String routeName = '/signIn';
  @override
  State<SignInscreen> createState() => _SigninscreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final TextEditingController nameController = TextEditingController();
final TextEditingController companyCodeController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
bool tap = false;
bool visible = true;

@override
class _SigninscreenState extends State<SignInscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18, top: 80),
                child: Form(
                    key: _formKey,
                    child: Center(
                        child: Column(children: [
                      Image.asset("assets/images/Logo.png"),
                      CustomText.s24(
                        "Welcome Back!",
                        bold: true,
                        color: Palette.appColors.mainColor,
                      ),
                      CustomRow("Sign in to your account or", "Sign Up",
                          SignUpscreen.routeName),
                      CustomTextFormField(
                        label: "Username",
                        hintText: "Enter your name",
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        validator: (value) =>
                            value!.isEmpty ? "Name is required" : null,
                      ),
                      CustomTextFormField(
                        label: "Company Code",
                        hintText: "Enter your code",
                        controller: companyCodeController,
                        keyboardType: TextInputType.text,
                        validator: (value) =>
                            value!.isEmpty ? "Code is required" : null,
                      ),
                      CustomTextFormField(
                        label: "Password",
                        hintText: "Enter your password",
                        controller: passwordController,
                        isPassword: visible,
                        validator: (value) =>
                            value!.length < 6 ? "Min 6 characters" : null,
                        suffixIcon: tap
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                        onSuffixTap: () {
                          setState(() {
                            tap = !tap;
                            visible = !visible;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context,ForgetPass.routeName);
                              },
                              child: CustomText.s14(
                                "Forget Password",
                                bold: true,
                                color: Palette.textColor.secondTextColor,
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, CreateNewPassScreen.routeName);
                              },
                              child: CustomText.s14(
                                "Create new pass",
                                bold: true,
                                color: Palette.textColor.secondTextColor,
                              )),
                        ],
                      ),
                      CustomButton(
                        text: "Sign In",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, CustomNav.routeName);
                            print("All valid, proceed");
                          }
                        },
                      ),
                    ]))))));
  }
}
