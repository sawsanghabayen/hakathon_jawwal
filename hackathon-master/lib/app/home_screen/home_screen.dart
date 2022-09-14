import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/model/FaliaModel.dart';
import 'package:hackathon_project/widgets/Dialog/Coustom_Dialog.dart';

import '../../Get/FirebaseController.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = Get.put<FirebaseController>(FirebaseController());



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25.h,
      ),
      child: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 158.h,
              initialPage: 1,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              enlargeCenterPage: true,
              disableCenter: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
            items: controller.falias.map((element) {
              return  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  // alignment: Alignment.bottomCenter,
                  children: [
                    ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 0.5,
                        sigmaY: 0.5,
                      ),
                      child: Image.network(
                        element.imagesUrl![0],
                        color: Colors.grey.withOpacity(0.8),
                        colorBlendMode: BlendMode.modulate,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      child: Text(
                        ' ${element.numberOfTickets} تذاكر لحضور ${element.name} فقط  ',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Color(0xFFFFFFFF)),
                      ),
                      bottom: 14.h,
                      right: 24.w,
                    ),
                    // SizedBox(height: ,)
                  ],
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 39.h,
          ),
          Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Text(
                'أشهر الفعاليات',
                style: Theme.of(context).textTheme.bodyText2,
              )),
          SizedBox(
            height: 14.sp,
          ),
          SliderWidget(
              array: controller.fillterEvints(fillterBy: 'أشهر الفعاليات')),
          SizedBox(
            height: 24.sp,
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Text(
              'سيبدأ قريبا',
              style:
              Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 170.h,
              initialPage: 1,
              reverse: false,
              autoPlay: true,
              disableCenter: true,
              enableInfiniteScroll: true,
              viewportFraction: 01,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
            items: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: 170.h,
                      width: 343.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Image.asset(
                        'images/slider.png',
                        color: Colors.grey.withOpacity(0.8),
                        colorBlendMode: BlendMode.modulate,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\$20',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal)),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'المهرجان الكيودو ',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text('الخميس 2022\ 10\12',
                                style:Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal)),
                            SizedBox(
                              width: 83.w,
                            ),
                            // Spacer(),
                            Text('1K',
                                style: Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal)),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'تذكرة متاحة',
                              style: Theme.of(context).textTheme.headline5?.copyWith(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              width: 31.w,
                            )
                          ],
                        ),
                      ],
                    ),
                    bottom: 10.h,
                    right: 21.w,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Text(
              'أحدث الفعاليات',
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          SliderWidget(
              array: controller.fillterEvints(fillterBy: 'أحدث الفعاليات')),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  late RxList<FaliaModel> array;

  SliderWidget({required this.array});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: ListView.builder(
        itemCount: array.length,
        itemBuilder: (context, index) {
          return Container(
            height: 200.h,
            width: 140.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.black26),
            margin: EdgeInsets.only(left: 15.w, right: index == 0 ? 15.w : 0),
            child: InkWell(
              onTap: () {
                Get.to(DetailsScreen(falia: array[index]));
              },
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.hardEdge,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      array[index].imagesUrl![0].toString(),
                      color: Colors.grey.withOpacity(0.8),
                      colorBlendMode: BlendMode.modulate,
                      fit: BoxFit.fill,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r)),
                  ),
                  Positioned(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(array[index].ticketPrice.toString() + "\$",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold)),
                        Text(
                          array[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(array[index].numberOfTickets.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text('تذكرة متاحة',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    right: 10.w,
                    bottom: 8.h,
                  ),
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
