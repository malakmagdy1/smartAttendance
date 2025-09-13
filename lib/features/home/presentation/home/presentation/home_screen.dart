import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_salma/core/theme/palette.dart';

import '../../notification/presentation/notification_screen.dart';
import '../../tasks/presentation/task_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isCheckedIn = false;
  String? location;

 @override
void initState() {
  super.initState();

  // تشغيل الأنيميشن
  _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  // استدعاء الموقع
  _getLocation();
}


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        isCheckedIn = true;
      });

      // تحديد الموقع
      Position position = await _determinePosition();
print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");


      setState(() {
        location =
            "Lat: ${position.latitude}, Long: ${position.longitude}";
      });
    }
  }
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // تحقق إن خدمة الموقع شغالة
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // تحقق من الإذن
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // رجّع الموقع
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }


  // 🔹 فنكشن تستدعي _determinePosition
  void _getLocation() async {
    try {
      Position position = await _determinePosition();
      print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== Header =====
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                              "assets/images/profile.png"),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello, Farida",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.appColors.mainColor)),
                            const Text("Full Stack",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            const Text("09:00 AM → 05:00 PM",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(onTap: () {
                          Navigator.pushNamed(context, TasksScreen.routeName);
                        },
                          child: SvgPicture.asset(
                            "assets/icons/material-symbols_task-rounded.svg",
                            width: 24,
                            height: 24,
                            color: Palette.appColors.mainColor,
                          ),
                        ),
                        const SizedBox(width: 15),
                        InkWell(onTap: () {
                          Navigator.pushNamed(
                              context, NotificationScreen.routeName);
                        },
                          child: SvgPicture.asset(
                            "assets/icons/Subtract.svg",
                            width: 24,
                            height: 24,
                            color: Palette.appColors.mainColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 20),

                // ===== Clock In/Out Card =====
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.shade200,
                        blurRadius: 15,
                        spreadRadius: 2,
                        offset: const Offset(0, 6),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      // Clock In/Out Button with animation
                      // ===== Clock In/Out Button with animation =====
                      Center(
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            double scale = 1 + 0.1 *
                                (1 - (2 * (_controller.value - 0.5)).abs());
                            double shadowBlur = 20 + 10 * _controller.value;

                            return Transform.scale(
                              scale: scale,
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isCheckedIn
                                      ? Palette.neutral.color3
                                      : Palette.appColors.mainColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      blurRadius: shadowBlur,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    isCheckedIn ? "Clock In" : "Clock In",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        isCheckedIn
                            ? "You are at work"
                            : "You are not at work yet",
                        style: const TextStyle(color: Colors.grey),
                      ),

                      if (isCheckedIn && location != null) ...[
                        const SizedBox(height: 10),
                        Text(
                          location!,
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 12),
                        ),
                      ],

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Start Time",
                                  style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                              Text("00:00 AM",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Remaining Time",
                                  style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                              Text("00h : 00",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 40),
                          backgroundColor:
                          isCheckedIn ? Palette.appColors.mainColor : Palette
                              .neutral.color3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _takePhoto,
                        label: Text(
                          isCheckedIn ? "Photo Taken" : "Take a photo",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ===== Monthly Statistics =====
                Text("Monthly Statistics",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Palette.appColors.mainColor)),

                const SizedBox(height: 20),

                Row(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),

                    _buildStatCard(
                        "Delays", "3", "5 Delays Remaining",
                        Palette.appColors.mainColor),
                    SizedBox(width: 100,),
                    _buildStatCard(
                        "Attendance", "3", "4 Days left",
                        Palette.neutral.color9),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // ===== Helper Widget for Stats =====
  Widget _buildStatCard(
      String title, String number, String subtitle, Color color) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                value: 0.75,
                strokeWidth: 14,
                color: color,
                backgroundColor: Colors.grey.shade200,
              ),
            ),
            Text(number,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),
                SizedBox(height: 10,),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10,),
        Text(subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}