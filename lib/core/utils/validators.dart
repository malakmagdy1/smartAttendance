// import '../localization/localization_manager.dart';
//
// class Validators {
//   Validators();
//
//   late final _localizations = LocalizationManager.instance.appLocalizations;
//
//   String? required(String? value, {required String title}) {
//     if (value == null || value.isEmpty) {
//       return _localizations.mustEnter(title.toLowerCase());
//     }
//     return null;
//   }
//
//   String? phone(String? value, {required String title}) {
//     if (value == null || value.isEmpty) {
//       return required(value, title: title);
//     }
//     final phoneRegExp = RegExp(
//         r'\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$');
//     if (!phoneRegExp.hasMatch(value)) {
//       return _localizations.invalidPhoneNumber;
//     }
//     return null;
//   }
//
//   String? password(String? value) {
//     if (value == null || value.isEmpty) {
//       return required(value, title: _localizations.password);
//     }
//     return null;
//   }
//
//   String? identityNumber(String? value) {
//     if (value == null || value.isEmpty) {
//       return required(value, title: _localizations.nationalId);
//     }
//     if (value.length < 7) {
//       return _localizations.identityNumberValidation;
//     }
//     return null;
//   }
//
//   String? email(String? value, {bool required = true}) {
//     if (required && (value ?? '').isEmpty) {
//       return this.required(value, title: _localizations.email);
//     }
//
//     if (!required && (value ?? '').isEmpty) {
//       return null;
//     }
//
//     final bool emailValid = RegExp(
//       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
//     ).hasMatch(value ?? '');
//     if (!emailValid) {
//       return _localizations.invalidEmail;
//     }
//
//     return null;
//   }
//
//   String? otp(String? value) {
//     if (value == null || value.length < 4) {
//       return _localizations.otpValidation;
//     }
//     return null;
//   }
// }
