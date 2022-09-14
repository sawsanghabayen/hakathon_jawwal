import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
 import 'package:hackathon_project/app/taps/third_tap_screen.dart';

import '../../widgets/events.dart';
import '../taps/first_tab_screen.dart';
import '../taps/second_tab_screen.dart';
import '../ticket/taps/basic_info_screen.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
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

      appBar: AppBar(title: Text("فعاليات"),
        leading: Icon(color: Colors.transparent,Icons.arrow_forward_ios),
        actions: [

          IconButton(color: Colors.black,icon: Icon(Icons.add),onPressed: (){
            // Navigator.pushNamed(context, '/add_event');
            Get.to((){return AddEventScreen();});
          },)
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w ,vertical: 20.h),
        child: Column(
          children: [

            Container(
              height: 84.h,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الفعاليات",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "100K فعالية",
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  ),
                  // Divider(),
                  SizedBox(width: 40.w,),

                  VerticalDivider(

                    color: Color(0xFFBBBBBB),
                    thickness: 0.5,
                  ),
                  SizedBox(width: 40.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "200 K ",
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "حجز",
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "70%",
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "200 K ",
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "زيارة",
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "30%",
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 22.h,),
            Divider(  ),

            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 1),
                              blurRadius: 0.1,
                            ),
                          ]),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        labelPadding: const EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        indicator: const BoxDecoration(
                            color: Color(0XFF001BFF),
                            borderRadius: BorderRadius.all(Radius.circular(35))),
                        tabs: [
                          Text(
                            'نشطة ',
                            style: GoogleFonts.cairo(),
                          ),
                          Text(
                            'مكتملة',
                            style: GoogleFonts.cairo(),
                          ),
                          Text(
                            'ملغاه',
                            style: GoogleFonts.cairo(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),


                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 400),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          FirstTabScreen(),

                          SecondTabScreen(),

                          ThirdTabScreen(),
                        ],
                      ),
                    ),
                    // SizedBox(height: 50.h,),



                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}