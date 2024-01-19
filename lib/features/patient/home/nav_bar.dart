import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_se7ety/core/utils/colors.dart';
import 'package:flutter_application_1_se7ety/core/utils/styles.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class PatientMainPage extends StatefulWidget {
  const PatientMainPage({super.key});

  @override
  State<PatientMainPage> createState() => _PatientMainPageState();
}

class _PatientMainPageState extends State<PatientMainPage> {
  int _selectedIndex = 0;
  // final List _pages = [
  //   patientHomepage(),
  //   SearchView(),
  //   MyAppointments(),
  //   patientprofile(),
  // ];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

 @override
  void initState() {
    super.initState();
   _getUser();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: AppColors.black.withOpacity(.3),
                )
              ]),
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: GNav(
              curve: Curves.easeOutExpo,
              rippleColor: AppColors.gray,
              hoverColor: AppColors.gray,
              haptic: true,
              tabBorderRadius: 18,
              gap: 4,
              activeColor: AppColors.white,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              duration: Duration(milliseconds: 350),
              tabBackgroundColor: AppColors.color1,
              textStyle: getbodyStyle(color: AppColors.white),
              tabs: [
                GButton(iconSize: 26, icon: Icons.home, text: 'الرئيسيه'),
                GButton(
                  icon: Icons.search_sharp,
                  iconSize: 20,
                  text: 'البحث',
                ),
                GButton(
                  icon: Icons.calendar_month,
                  text: 'المواعيد',
                  iconSize: 26,
                ),
                GButton(
                  icon: Icons.monetization_on_rounded,
                  text: 'الحساب',
                  iconSize: 29,
                )
              ],
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
            ),
          )),
        ),
      ),
    );
  }
}
