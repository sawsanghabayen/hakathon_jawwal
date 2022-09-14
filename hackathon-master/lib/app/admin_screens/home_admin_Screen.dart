import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/app/admin_screens/Tickets.dart';
import 'package:hackathon_project/app/admin_screens/event_screen_edit.dart';

import '../../model/ui_model/screen_model.dart';
import '../btn_screens/HomeAdminScreen.dart';
import '../praymary_screen/account_screen.dart';
import '../taps/first_tab_screen.dart';
import '../taps/second_tab_screen.dart';

class BTNScreen extends StatefulWidget {
  const BTNScreen({Key? key}) : super(key: key);

  @override
  State<BTNScreen> createState() => _BTNScreenState();
}

class _BTNScreenState extends State<BTNScreen> with SingleTickerProviderStateMixin{
  int _selectedPageIndex = 0;

  final List<BnScreen> _screens = <BnScreen>[
      BnScreen(title: 'أهلا وسهلا', widget: HomeAdminScreen()),
     BnScreen(title: 'الفعاليات', widget: EventsScreen()),
     BnScreen(title: 'تذاكري', widget: TazakerScreen()),
     BnScreen(title: 'الاعدادات', widget: AccountScreen(isAdmin:true)),
  ];

  late TabController _tabController;

  @override
  void initState() {
     super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _screens[_selectedPageIndex].widget,
      bottomNavigationBar:
      BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int selectedPageIndex) {
            setState(() => _selectedPageIndex = selectedPageIndex);
          },
          currentIndex: _selectedPageIndex,
          selectedItemColor: Color(0xFF001BFF),

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.event_available),label: 'فعالياتي'),
            BottomNavigationBarItem(icon: Icon(Icons.category),label: 'تذاكري'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'حسابي'),
          ]),
    );
  }
}