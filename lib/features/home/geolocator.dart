// import 'package:geolocator/geolocator.dart';

// Future<Position?> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // تحقق إن الخدمة شغالة
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }

//   // تحقق من الإذن
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }

//   // رجع الموقع
//   return await Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.high,
//   );
// }
