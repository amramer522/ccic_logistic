import 'package:ccic_g1_2026_flutter/views/home/pages/home.dart';
import 'package:ccic_g1_2026_flutter/views/home/pages/notifications.dart';
import 'package:ccic_g1_2026_flutter/views/home/pages/profile.dart';
import 'package:ccic_g1_2026_flutter/views/home/pages/trips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPage = 0;

  final titles = ['Home', 'Trips', 'Notifications', 'Profile'];
  final icons = ['home.svg', 'trips.svg', 'notifications.svg', 'profile.svg'];
  final pages = [HomePage(), TripsPage(), NotificationsPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(75),
          child: GNav(
            selectedIndex: currentPage,
            tabMargin: EdgeInsetsGeometry.symmetric(vertical: 16),
            backgroundColor: Color(0xff0A4AEB).withValues(alpha: .05),
            activeColor: Colors.white,
            gap: 6,
            iconSize: 24,
            textSize: 12,
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
            tabBackgroundColor: Color(0xff1C3877),
            onTabChange: (value) {
              currentPage = value;
              setState(() {});
            },
            tabs: List.generate(
              pages.length,
              (index) => GButton(
                icon: Icons.home,
                leading: SvgPicture.asset(
                  'assets/icons/${index == 2 && currentPage != 2 ? 'notifications_dotted.svg' : icons[index]}',
                  color: currentPage == index ? Colors.white : null,
                ),
                text: titles[index],
                margin: currentPage == 0 && index == 0
                    ? EdgeInsetsDirectional.only(start: 6)
                    : currentPage == 3 && index == 3
                    ? EdgeInsetsDirectional.only(end: 6)
                    : null,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
