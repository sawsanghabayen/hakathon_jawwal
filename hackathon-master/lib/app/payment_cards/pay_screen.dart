import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/card_payment.dart';
import '../../widgets/payment_way.dart';


class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

bool visibile = false;
Color color = Color(0xFFDDE1FF);

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
        title: Text('كيف تحب ان تدفع؟',
            style:
            GoogleFonts.cairo(color: Color(0xFF000637), fontSize: 16.sp)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [
            Text(
              'انت على بعد خطوة من حجز تذكرة',
              style:
              GoogleFonts.cairo(color: Color(0xFF000637), fontSize: 16.sp),
            ),


            SizedBox(height: 14.h),

            Text('كيف تحب ان تدفع؟',
                style: GoogleFonts.cairo(
                    color: Color(0xFF000637), fontSize: 14.sp)),
            SizedBox(height: 24.h),

            PaymentsWay(
              radio: InkWell(
                onTap: (){
                  setState(() { visibile = !visibile;
                  color=Color(0xFF001BFF);
                  });

                },
                child: Container(width:18.w ,height: 18.h,
                  decoration: BoxDecoration(
                    color:color,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              leadingtitle: 'بطاقة الائتمان',
              widget: InkWell(
                child: Text('اضافة بطاقة',
                    style: GoogleFonts.cairo(
                        color: Color(0xFF0012AA), fontSize: 10.sp)),
                onTap: () {

                  Navigator.pushNamed(context, '/newpay_screen');

                  setState(
                          ()=> visibile = !visibile

                  );
                },
              ),
            ),
            SizedBox(height: 16.h,),

            Visibility(
              visible: visibile, child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),

              child:SizedBox(
                height: 160.h,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return
                      Padding(
                        padding:  EdgeInsets.only(left:16.w ),
                        child: CardsPayments(holderName: 'Sawsan Sami', date: '05/24', cvv: '232', cardNum: '1591852367521489', image: 'images/payment.jpeg', color: Color(0xff1b447b)),
                      );

                  },

                ),
              ),),),
            SizedBox(
              height: 24.h,
            ),
            InkWell(
              onTap: (){
                setState(()=> visibile = !visibile );

              },
              child: PaymentsWay(
                radio: InkWell(
                  onTap: (){
                    setState(() { visibile = !visibile;
                    });

                  },
                  child: Container(width:18.w ,height: 18.h,
                    decoration: BoxDecoration(
                      color:Color(0xFFDDE1FF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),

                leadingtitle: 'كاش ',
                widget: Text(''),
              ),
            ),




            SizedBox(
              height: 24.h,
            ),
            InkWell(
              onTap: (){
                setState(()=> visibile = !visibile );

              },
              child: PaymentsWay(
                radio: InkWell(
                  onTap: (){
                    setState(() { visibile = !visibile;
                    });

                  },
                  child: Container(width:18.w ,height: 18.h,
                    decoration: BoxDecoration(
                      color:Color(0xFFDDE1FF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),

                leadingtitle: 'جوال بي ',
                widget: Text(''),
              ),
            ),

            Spacer(),
            ElevatedButton(
                onPressed: ()   {

                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(343.w, 48.h),
                    primary: Color(0xff2940FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.r))),
                child: Text(
                  'شراء التذاكر 60 ',
                  style: GoogleFonts.nunito(
                      fontSize: 16.sp,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold),
                )),
            // SizedBox(height: 34.h,)
          ],
        ),
      ),
    );
  }
}