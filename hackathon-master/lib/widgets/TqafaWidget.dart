import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/Get/FirebaseController.dart';
import 'package:hackathon_project/model/FaliaModel.dart';


class TqafaWidget extends StatefulWidget {

 late RxList<FaliaModel> array;

 TqafaWidget({required this.array});

  @override
  State<TqafaWidget> createState() => _TqafaWidgetState();
}

class _TqafaWidgetState extends State<TqafaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
             padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
             child: ListView.builder(
               itemCount: widget.array.length,
               itemBuilder: (context, index) {
                 return Padding(
                   padding: EdgeInsets.only(bottom: 30.h),
                   child: Container(
                     width: double.infinity,
                     clipBehavior: Clip.antiAlias,
                     child: Row(
                       children: [
                         Expanded(
                           flex: 1,
                           child: Container(
                             height: 110.h,
                             clipBehavior: Clip.hardEdge,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(7.r)
                             ),
                             child: Image.network(
                                 widget.array[index].imagesUrl![0],
                                 color: Colors.grey.withOpacity(0.8),
                                 colorBlendMode: BlendMode.modulate,
                                 fit: BoxFit.cover,
                             ),
                           ),

                         ),
                         Expanded(
                           flex: 2,
                           child: Padding(
                             padding:
                             EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   widget.array[index].name,
                                   style: GoogleFonts.cairo(
                                       color: Color(0xFF120007), fontSize: 14.sp),
                                 ),
                                 Text(
                                   widget.array[index].eventchart![0].date+" "+widget.array[index].eventchart![0].day ,
                                   style: GoogleFonts.cairo(
                                       color: Color(0xFF120007), fontSize: 14.sp),
                                 ),
                                 Row(
                                   children: [
                                     Text(
                                       widget.array[index].numberOfTickets.toString()  ,
                                       style: GoogleFonts.cairo(
                                           color: Color(0xFF120007), fontSize: 14.sp),
                                     ),
                                     SizedBox(
                                       width: 6.w,
                                     ),
                                     Text(
                                       'تذكرة متاحة',
                                       style: GoogleFonts.cairo(
                                           color: Color(0xFF120007), fontSize: 14.sp),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     Icon(Icons.location_on_outlined),
                                     Text(
                                       widget.array[index].location.split(' ')[0],
                                       style: GoogleFonts.cairo(
                                           color: Color(0xFF120007), fontSize: 12.sp),
                                     ),
                                     SizedBox(
                                       width: 105.w,
                                     ),
                                     Icon(Icons.favorite_border),
                                     SizedBox(
                                       width: 6.w,
                                     )
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         ),

                       ],
                     ),

                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8.r),
                       color: Colors.white,
                     ),
                   ),
                 );
               },
             ),
           );

  }
}
