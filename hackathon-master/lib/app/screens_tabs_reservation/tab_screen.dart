/*

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'activate_screen_tab.dart';
import 'cancel_screen_tab.dart';
import 'complete_screen_tab.dart';


class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // يرث   ال this تعود من اشي اسمه mixin  لازم اعرفه فوق مع الاكلاس الاساسي باستخدام with
    // الرقم هوا عدد الصفحات
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [


        Container(

          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0,1),
              blurRadius: 0.1,
            ),
          ]),

          child: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
           labelPadding:  EdgeInsets.symmetric( vertical: 8),
           padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),

      indicator: const BoxDecoration(
                color: Color(0XFF389898),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )),

          tabs: const [
            Text('نشطة '),
            Text('مكتملة'),
            Text('ملغاه'),
          ],
        ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 200),
          child: TabBarView(
            controller: _tabController,

            children:   [
              ActiveScreen(),

              CompleteScreen(),

              CancelScreen(),

            ],
          ),
        ),
      ],
    );
  }
}
*/
