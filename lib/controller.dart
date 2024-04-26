import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medical_expert_app/features/Home/views/home_view.dart';
import 'package:medical_expert_app/features/Profile/views/profile_view.dart';
import 'package:medical_expert_app/features/history_view.dart';
import 'core/componants/colors.dart';

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  @override
  void initState() {
    super.initState();
  }

  int index = 0;
  final List<Widget> views = [
    HomeView(),
    HistoryView(),
    HomeView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views.elementAt(index),
      bottomNavigationBar: GNav(
        backgroundColor: kSecondary,
        gap: 6,
        selectedIndex: index,
        onTabChange: (index) {
          setState(() {
            this.index = index;
          });
        },
        activeColor: kPrimary,
        iconSize: 28,
        tabs: const [
          GButton(
            icon: Icons.home_filled,
          ),
          GButton(
            icon: Icons.history,
          ),
          GButton(
            icon: Icons.favorite_border,
          ),
          GButton(
            icon: Icons.person_outlined,
          ),
        ],
      ),
    );
  }
}
