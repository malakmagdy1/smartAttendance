import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theme/palette.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../report/presentation/report_screen.dart';
import '../../request/presentation/req_screen.dart';
import 'home_screen.dart';

class CustomNav extends StatefulWidget {
  static const String routeName = '/nav';

  const CustomNav({super.key});

  @override
  State<CustomNav> createState() => _CustomNavState();
}

class _CustomNavState extends State<CustomNav> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = const [
    HomeScreen(),
    ReportsScreen(),
    RequestScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widgetOptions[_selectedIndex],

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 6,
            color: Palette.appColors.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(
                  iconData: Icons.home_outlined,
                  label: 'Home',
                  index: 0,
                ),
                buildNavItem(
                  svgPath: "assets/icons/tabler_report-search.svg",
                  label: 'Reports',
                  index: 1,
                ),
                const SizedBox(width: 60), // Space for FAB
                buildNavItem(
                  svgPath: "assets/icons/lsicon_order-edit-filled.svg",
                  label: 'Requests',
                  index: 2,
                ),
                buildNavItem(
                  iconData: Icons.person,
                  label: 'Profile',
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.appColors.mainColor,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgPicture.asset(
          "assets/icons/majesticons_qr-code.svg",
          width: 24,
          height: 24,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildNavItem({
    IconData? iconData,
    String? svgPath,
    required String label,
    required int index,
  }) {
    assert(iconData != null || svgPath != null,
        'Provide either iconData or svgPath');

    final bool selected = _selectedIndex == index;
    final Color color = selected ? Colors.white : Palette.neutral.color3;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 25,
            width: 25,
            child: svgPath != null
                ? SvgPicture.asset(
                    svgPath,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  )
                : Icon(iconData, color: color, size: 25),
          ),
          Text(
            selected ? label : '',
            style: TextStyle(color: color, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
