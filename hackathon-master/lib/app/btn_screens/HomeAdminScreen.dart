import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/Get/FirebaseController.dart';
import 'package:hackathon_project/app/admin_screens/details_event_admin_screen.dart';
import 'package:hackathon_project/app/admin_screens/event_screen_edit.dart';
import '../../widgets/events.dart';

class HomeAdminScreen extends StatelessWidget {
 var controller = Get.put<FirebaseController>(FirebaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("أهلا وسهلا",style: Theme.of(context).textTheme.bodyText2,),
        leading: Icon(color: Colors.transparent, Icons.arrow_forward_ios),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
          SizedBox(
            height: 32.h,
          ),
          Container(
            height: 80.h,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
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
                      "الحجوزات",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "200K",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "فعالية",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF909090),
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
                    Row(
                      children: [
                        Text(
                          controller.falias.length.toString(),
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "فعالية",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF909090),
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الايرادات",
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "200K",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          "+فعالية",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF909090),
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Divider(),
          Row(
            children: [
              Text(
                'الاكثر طلبا',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF000637),
                  fontSize: 16.sp,
                ),
              ),
              Spacer(),

            ],
          ),
          SizedBox(height: 20.h,),
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:  controller.falias.length,
              itemBuilder: (context, index) {
                return   Events(image:controller.falias[index].imagesUrl![0]
                  ,ticket_available: controller.falias[index].ticketPrice.toString(), title: controller.falias[index].name, data: controller.falias[index].eventchart![0].date
                  , Reservation: controller.falias[index].numberOfTickets.toString()
                  ,  onTap: () {
                  Get.to(

                        DetailsEventAdmin(
                         falia: controller.falias[index],
                      )

                  );
                },);
              },
            ),
          ),


        ]),
      ),
    );
  }
}
