import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
    appBar: AppBar(
      backgroundColor: Color(0xFFD9D9D9),
    title: Text(
    'بطاقة الدفع',
    // fontSize: 17.sp,
    // color: Color(0xFF222B45),
    ),

    ),
      floatingActionButton: Align(
        alignment: AlignmentDirectional.bottomCenter,

        child: FloatingActionButton(

          backgroundColor: Color(0xFF2940FF),
          onPressed: () {
            // Navigator.pushNamed(context, '/new_payments_screen');
            Navigator.pushNamed(context, '/pay_screen');
          },
          child: Icon(Icons.add),
        ),
      ),
      body:Padding(
        padding:  EdgeInsets.only(top: 29.h ,left: 28.w ,right: 28.w) ,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {


          return
            Padding(
              padding:  EdgeInsets.only(bottom: 24.94.h),
              child: Stack(
                children: [
                  Container(
                    // width: 315.w,
                    height: 159.51.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        6.r,
                      ),

                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,

                        colors: [
                           Color(0xff8B32F5).withOpacity(1) ,
                           Color(0xff4C44F8).withOpacity(0.1),
                          // Color(0xff8B32F5).withOpacity(1) ,

                          // Color(0xff8B32F5).withOpacity(1) ,

                          // Colors.black45,
                        ],

                      ),

                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 27.91.h,),
                          Image.asset('images/card.png'),
                          SizedBox(height: 28.h,),

                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('4000' ,style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white ),),
                              Text('****',style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white ),),
                              Text('****',style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white ),),
                              Text('7689',style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white ),),
                            ],
                          ),
                          // SizedBox(height: 13.96.h,),
                        ],
                      ),
                    ),



                  ),

                  Positioned(child:
                      Icon(Icons.check_circle ,size: 18.sp ,color: Color(0xFF00A145))

                    /*Container(
                      width: 18.w ,height: 18.h,
                      decoration:BoxDecoration(borderRadius:  BorderRadius.circular(50.r),
                          color: Color(0xFF00A145)*/
                    // child: Icon(Icons.check,color: Colors.white,),
                  ,top: 8.h,right: 8.w,),
                  Positioned(child:  Text('05/22',style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white ),),bottom: 24.h,right: 98.w,),
                  Positioned(child:  Image.asset('images/visa.png' ,width: 60.w ,height: 20.h,),bottom: 12.h,right: 14.w,),

                ],


          ),
            );

        },),
      ),
    );
  }
}
