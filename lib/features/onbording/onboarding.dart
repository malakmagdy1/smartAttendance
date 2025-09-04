import 'package:flutter/cupertino.dart';
import '../auth/presentation/pages/SignUpScreen.dart';
import 'widget/onboardingData.dart';

class Onboarding extends StatefulWidget {
  static const String routeName='/Onboarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  late List<OnboardingItem> data;

  @override
  void initState() {
    super.initState();

    data = [
      OnboardingItem(
        title: "Redefining Attendance",
        text: "An intuitive system built to simplify how teams check in, track time, and stay aligned.",
        imagePath: "assets/images/On Boarding 1.png",
        skip: true,
        next: _nextPage,
      ),
      OnboardingItem(skip: true,
          title: "Built Around You",
          text: "Easily view your tasks, monitor your hours, and stay connected with HR — all in one place.",
          imagePath: "assets/images/On Boarding 2.png",
          backIcon: true,
          next:()=> Navigator.pushNamed(context, SignUpscreen.routeName),
          backnav:_goToFirstPage
      ),
    ];
  }

  void _goToFirstPage() {
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _nextPage() {
    if (_currentPage < data.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to next screen (e.g., login)
      Navigator.pushReplacementNamed(context, SignUpscreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: data.length,
      onPageChanged: (index) {
        setState(() => _currentPage = index);
      },
      itemBuilder: (context, index) {
        final item = data[index];
        return OnboardingData(
          title: item.title,
          text: item.text,
          imagePath: item.imagePath,
          backIcon: item.backIcon,
          skip: item.skip,
          next:item.next,
          backnav: item.backnav,
        );
      },
    );
  }
}

