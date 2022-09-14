import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


class Events extends StatelessWidget {
  Events({
    Key? key,
    required this.image,
    required this.title,
    required this.Reservation,
    required this.ticket_available,
    required this.data,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  final String image;
  final String title;
  final String Reservation;
  final String ticket_available;
  final Widget? icon;
  final String data;
  final VoidCallback onTap;

  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(8.r))),
          height: 105.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: double.infinity,
                  child: Image.network(
                    image,
                    color: Colors.grey.withOpacity(0.8),
                    colorBlendMode: BlendMode.modulate,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(
                width: 10.w,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          " حجز ",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          Reservation,
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                            fontSize: 13.sp,
                          ),
                        ),
                        Text(
                          " | ",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 13.sp,
                          ),
                        ),
                        Text(
                          " تذكرة متبقية ",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          ticket_available,
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "تاريخ الفعاليات : " + data,
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
              //
              // SizedBox(
              //   width: 60.w,
              // ),
              //
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
