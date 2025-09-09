import 'package:flutter/material.dart';
import 'package:test_salma/features/home/presentation/home/presentation/navBar.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../core/widgets/customTextFormField/customTextformfield.dart';
import '../../../../../core/widgets/text/custom_text.dart';
import '../widget/customrow.dart';
import 'SignInScreen.dart';

class SignUpscreen extends StatefulWidget {
  static const String routeName = "/loginscreen";

  const SignUpscreen({super.key});

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignUpscreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController conformPasswordController =
  TextEditingController();
  final TextEditingController idController = TextEditingController();

  final TextEditingController companyCodeController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool tap = false;
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18, top: 80),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  CustomText.s24("Welcome!",
                      color: Palette.appColors.mainColor, bold: true),
                  const CustomRow("Create a new account or", "Sign In",
                      SignInscreen.routeName),
                  CustomTextFormField(
                    label: "Username",
                    hintText: "Enter your name",
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) =>
                        value!.isEmpty ? "Name is required" : null,
                  ),
                  CustomTextFormField(
                    label: "Employee ID",
                    hintText: "Enter your ID",
                    controller: idController,
                    keyboardType: TextInputType.text,
                    validator: (value) =>
                        value!.isEmpty ? "ID is required" : null,
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
                    hintText: "enter your Password",
                    controller: conformPasswordController,
                    isPassword: visible,
                    validator: (value) =>
                        value!.length < 6 ? "Min 6 characters" : null,
                    suffixIcon:
                        tap ? Icons.visibility_off_outlined : Icons.visibility,
                    onSuffixTap: () {
                      setState(() {
                        tap = !tap;
                        visible = !visible;
                      });
                    },
                  ),
                  CustomTextFormField(
                    label: "Confirm Password",
                    hintText: "Confirm your Password",
                    controller: conformPasswordController,
                    isPassword: visible,
                    validator: (value) =>
                        value!.length < 6 ? "Min 6 characters" : null,
                    suffixIcon:
                        tap ? Icons.visibility_off_outlined : Icons.visibility,
                    onSuffixTap: () {
                      setState(() {
                        tap = !tap;
                        visible = !visible;
                      });
                    },
                  ),
                  CustomTextFormField(
                    label: "Phone Number",
                    hintText: "Enter your number",
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number is required";
                      } else if (!RegExp(r'^\d{8}$').hasMatch(value)) {
                        return "Enter valid 8-digit number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: "Sign Up",
                    onPressed: (){
Navigator.pushReplacementNamed(context, CustomNav.routeName);
                    },
                    // onPressed: () {
                    //   if (_formKey.currentState!.validate()) {
                    //     Navigator.pushNamed(context, HomeScreen.routeName);
                    //     print("All valid, proceed");
                    //   }
                    // },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

