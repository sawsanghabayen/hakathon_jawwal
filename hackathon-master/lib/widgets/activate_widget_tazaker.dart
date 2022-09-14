import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/events.dart';

class ActiveScreenTazaker extends StatelessWidget {
  const   ActiveScreenTazaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return   Padding(
          padding:  EdgeInsets.only(bottom: 16.h),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(8.r))),
            width: 120.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120.h,
                  height: double.infinity,
                  child: Image.asset('images/slider.png',
                    color: Colors.grey.withOpacity(0.8), colorBlendMode: BlendMode.modulate,
                    fit: BoxFit.cover,),
                ),
                SizedBox(
                  width: 10.w,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'فعاليات مهرجا صوة العرب',
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
                          '+100k',
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


                      ],
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.add_circle,color: Color(0xFF0012AA),)),
                          Text(
                            '1',
                            style:
                            GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 20
                                ,
                                color:  Color(0xFF0012AA)

                            ),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle,color:  Color(0xFF0012AA),),)
                        ],
                      ),
                    ),

                  ],
                ),
                //
                // SizedBox(
                //   width: 60.w,
                // ),
                //
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      color: Colors.blue,
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),

                    // SwitchListTile(
                    //   contentPadding: EdgeInsets.zero,
                    //   title: Text(""),
                    //   value: _notifications,
                    //   onChanged: (bool value) {
                    //     setState(() => _notifications = value);
                    //   },
                    // )
                  ],
                ),
              ],
            ),
          ),
        );

      },
    );
  }
}