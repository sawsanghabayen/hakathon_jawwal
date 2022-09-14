import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/app/praymary_screen/main_screen.dart';
import 'package:hackathon_project/app/praymary_screen/reservations.dart';

import '../model/ui_model/screen_model.dart';
import 'praymary_screen/account_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedPageIndex = 0;

   final List<BnScreen> _screens = <BnScreen>[
    BnScreen(title: 'اهلا وسهلا بك', widget: MainScreen()),
    BnScreen(title: 'حجوزاتي', widget: ReservationScreen()),
    BnScreen(title: 'الاعدادات', widget: AccountScreen(isAdmin: false,)),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
    //  backgroundColor: Colors.red,
      body: _screens[_selectedPageIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int selectedPageIndex) {
          setState(() => _selectedPageIndex = selectedPageIndex);
        },
        // هان تعرف اي index  انت موجود بناءا على تغير الحالة في ال set State
        currentIndex: _selectedPageIndex,
       // backgroundColor: Colors.red,
        selectedItemColor: Color(0xff001BFF),
        // هاي بتاثر على لون ال  icon
        selectedIconTheme: const IconThemeData(color: Color(0xff001BFF)),
        //  هاي الخاصية بتغير على نوع الخط ما بتغيرعلى لون الخط
        selectedLabelStyle: GoogleFonts.cairo(
            // color: Colors.black,

            fontWeight: FontWeight.w400),
        //*********************************
        // لا يوجد fixed في ال un selected
        unselectedItemColor: Colors.grey.shade400,
        unselectedIconTheme: const IconThemeData(
          color: Colors.grey,
          // الاثر هنا لحجم الايقونة اكبر ما يكون
          size: 24,
        ),
        unselectedLabelStyle: GoogleFonts.cairo(
          fontWeight: FontWeight.w300,
          // الفعالية هنا اقوى شوية
          fontSize: 11,
        ),
        // الاثر هنا اقل من الي بالقرب من االايقونة
        iconSize: 24,
        // فعالية الحجم بتكون اكبر لما تكون اقرب من هاي
        unselectedFontSize: 12,
        // selectedIconTheme: ,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Color(0XFF389898),
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              icon: Icon(Icons.home_outlined),
              label: 'الرئيسية'),
          BottomNavigationBarItem(
              backgroundColor: Color(0XFF389898),
              activeIcon: Icon(
                Icons.category,
                color: Colors.black,
              ),
              icon: Icon(Icons.category),
              label: 'حجوزاتي'),
          BottomNavigationBarItem(
              backgroundColor: Color(0XFF389898),
              activeIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'الاعدادات'),
        ],
      ),
    );
  }


}
