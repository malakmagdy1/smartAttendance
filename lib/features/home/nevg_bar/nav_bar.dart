
// import 'package:flutter/material.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onItemTapped;

//   const CustomBottomNavigationBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onItemTapped,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 6,
//       color: const Color(0xFF395486),
//       child: SizedBox(
//         height: 70,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             IconButton(
//               icon: Icon(Icons.home,
//                   color: selectedIndex == 0 ? Colors.white : Colors.white54,
//                   size: 28),
//               onPressed: () => onItemTapped(0),
//             ),
//             IconButton(
//               icon: Icon(Icons.insert_chart_outlined,
//                   color: selectedIndex == 1 ? Colors.white : Colors.white54,
//                   size: 28),
//               onPressed: () => onItemTapped(1),
//             ),
//             const SizedBox(width: 40), // فراغ للـ FAB
//             IconButton(
//               icon: Icon(Icons.note_alt,
//                   color: selectedIndex == 2 ? Colors.white : Colors.white54,
//                   size: 28),
//               onPressed: () => onItemTapped(2),
//             ),
//             IconButton(
//               icon: Icon(Icons.person,
//                   color: selectedIndex == 3 ? Colors.white : Colors.white54,
//                   size: 28),
//               onPressed: () => onItemTapped(3),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../../core/theme/palette.dart';
// import '../../../../../core/widgets/text/custom_text.dart';
// import '../widget/home_app_bar.dart';
// import '../widget/home_card_widget.dart';
// import '../widget/monthly_statistics_card_widget.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   static const String routeName = '/home';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const HomeAppBar(),
//             const HomeCardWidget(),
//             32.verticalSpace,
//             CustomText.s24(
//               'Monthly Statistics',
//               color: Palette.appColors.mainColor,
//               bold: true,
//             ),
//             24.verticalSpace,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Expanded(
//                   child: MonthlyStatisticsCardWidget(
//                     percentage: 3,
//                     title: 'Delays',
//                     description: '5 Delays Remaining',
//                   ),
//                 ),
//                 Expanded(
//                   child: MonthlyStatisticsCardWidget(
//                     percentage: 3,
//                     title: 'Attendance',
//                     description: '4 Days left',
//                     color: Palette.appColors.secondaryColor,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }