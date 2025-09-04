import 'package:flutter/material.dart';
import '../../../../../core/theme/palette.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../report/presentation/report_screen.dart';
import '../../request/presentation/req_screen.dart';
import 'home_screen.dart';

class CustomNav extends StatefulWidget {
  static const String routeName = '/nav';

  @override
  State<CustomNav> createState() => _CustomNavState();
}

class _CustomNavState extends State<CustomNav> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = [
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

      // BottomAppBar with rounded corners and FAB notch
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 6,
            color: Palette.appColors.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(Icons.home_outlined, 'Home', 0),
                buildNavItem(Icons.favorite_border_outlined, 'Reports', 1),
                SizedBox(width: 70), // Space for FAB
                buildNavItem(Icons.back_hand, 'Requests', 2),
                buildNavItem(Icons.person_2_outlined, 'Profile', 3),
              ],
            ),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.appColors.mainColor,
        onPressed: () {},
        child: Icon(
          Icons.document_scanner_outlined,
          color: Colors.white,
          size: 30,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100), // Fully circular
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    final bool selected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selected ? Colors.white : Palette.neutral.color7,
            size: 25,
          ),
          Text(
            selected ? label : '',
            style: TextStyle(
              color: selected ? Colors.white : Palette.neutral.color7,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
