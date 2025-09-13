import 'package:flutter/material.dart';

import '../../../../../core/theme/palette.dart';
import '../../../../../core/widgets/text/custom_text.dart';
import '../widget/privacy_card.dart';

class PrivacyPolicy extends StatelessWidget {
  static const String routeName = '/privacy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText.s24(
          "Privacy Policy",
          bold: true,
          color: Palette.appColors.mainColor,
        ),
      ),
      body: Column(
        children: [
          PrivacyCard(
            title: 'Information We Collect',
            textt:
                'We collect the following data to ensure proper functioning of the app:',
          ),
          PrivacyCard(
            title: "How We Use Your Information",
            textt: "We use your data to:",
          ),
          PrivacyCard(
            title: "Information Sharing",
            textt:
                "We do not share your personal information with third parties unless:",
          ),
          PrivacyCard(title: "Your Rights", textt: "You have the right to:"),
          PrivacyCard(
            title: "Data Security",
            textt:
                "We implement industry-standard security measures to protect your data from unauthorized access, including encryption and access control.",
          ),
          PrivacyCard(
            title: "Policy Updates",
            textt:
                "We may update this policy from time to time. You will be notified of any significant changes via the app",
          ),
        ],
      ),
    );
  }
}
