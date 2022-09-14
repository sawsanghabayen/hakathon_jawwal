import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/products_user.dart';
import '../taps/first_tab_screen.dart';
import '../taps/second_tab_screen.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text('فعاليات'),),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Column(
              children: [
                SizedBox(height: 60.h),
                Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  color: Color(0xD0FFFFFF),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "الفعاليات",
                              style: Theme.of(context).textTheme.headline6?.copyWith(

                                fontWeight: FontWeight.w600,



                              ),
                            ),
                            Text(
                              "100K فعالية",
                              style: Theme.of(context).textTheme.headline6?.copyWith(

                                fontWeight: FontWeight.w600,



                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "200 K ",
                                  style: Theme.of(context).textTheme.headline6?.copyWith(

                                    fontWeight: FontWeight.w600,



                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "حجز",
                                  style: Theme.of(context).textTheme.headline6?.copyWith(

                                    fontWeight: FontWeight.w600,

                                    color: Colors.blue,

                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "70%",
                                  style: Theme.of(context).textTheme.headline6?.copyWith(

                                    fontWeight: FontWeight.bold,

                                    color: Colors.grey,

                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "200 K ",
                                  style: Theme.of(context).textTheme.headline6?.copyWith(
    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "زيارة",
                                  style: Theme.of(context).textTheme.headline6?.copyWith(

                                    fontWeight: FontWeight.bold,

                                    color: Colors.red,

                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "30%",
                                  style: Theme.of(context).textTheme.headline6?.copyWith(

                                    fontWeight: FontWeight.bold,

                                     color: Colors.grey,

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // TabBar(
                //   controller: _tabController,
                //   labelPadding: EdgeInsets.zero,
                //   labelColor: Colors.black,
                //   indicator: BoxDecoration(
                //       color: Colors.blue.shade100,
                //       borderRadius: BorderRadius.circular(10),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.black45,
                //           offset: Offset(0, 3),
                //           blurRadius: 4,
                //         )
                //       ]),
                //   onTap: (int tabIndex) {
                //     setState(() => _tabController.index = tabIndex);
                //   },
                //   tabs: [
                //     Tab(text: 'نشطة'),
                //     Tab(text: 'منتهية'),
                //     Tab(text: 'ملغاة'),
                //   ],
                // ),
              ],
            ),
            Column(
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
                        color: Colors.blue,
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
                      FirstTabScreen(),

                      SecondTabScreen(),

                      FirstTabScreen(),

                    ],
                  ),
                ),
              ],
            )
           ],
        ),
 ),
    );
  }
}
