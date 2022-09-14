import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Get/reservations_get_controller.dart';
import '../../widgets/Dialog/Coustom_Dialog.dart';

class ActiveScreen extends StatefulWidget {
  const ActiveScreen({Key? key}) : super(key: key);

  @override
  State<ActiveScreen> createState() => _ActiveScreenState();
}

class _ActiveScreenState extends State<ActiveScreen> {
  ReservationsGetxController controller = Get.put(ReservationsGetxController());

  @override
  Widget build(BuildContext context) {
    return GetX<ReservationsGetxController>(
      builder: (controller) {
        return controller.reservationsItem.value.isNotEmpty
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    // ExpansionPanelList(
                    //     expandedHeaderPadding: EdgeInsets.symmetric(vertical: 10.h),
                    //     dividerColor: Colors.grey,
                    //     animationDuration: const Duration(seconds: 1),
                    //     elevation: 4,
                    //     expansionCallback: (panelIndex, isExpanded) {},
                    //     children: [
                    //       // ExpansionPanel(
                    //       //     isExpanded: true,
                    //       //     canTapOnHeader: true,
                    //       //     backgroundColor:
                    //       //         MediaQuery.of(context).platformBrightness ==
                    //       //                 Brightness.light
                    //       //             ? Colors.white
                    //       //             : Colors.black26,
                    //       //     headerBuilder: (context, isExpanded) {
                    //       //       return Row(
                    //       //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       //         children: [
                    //       //           Text(''),
                    //       //           Text(
                    //       //             controller.reservationsItem.value[index].name,
                    //       //             style: Theme.of(context).textTheme.bodyText2,
                    //       //           ),
                    //       //           Text(
                    //       //             controller.reservationsItem.value[index].date,
                    //       //             style: Theme.of(context).textTheme.bodyText2,
                    //       //           ),
                    //       //         ],
                    //       //       );
                    //       //     },
                    //       //     body:),
                    //     ]);
                    return ExpansionTile(
                      initiallyExpanded: true,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(''),
                          Text(
                            controller.reservationsItem.value[index].name,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            controller.reservationsItem.value[index].date,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "images/contents.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'التاريخ',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    'الموعد',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller
                                        .reservationsItem.value[index].date,
                                    style: GoogleFonts.cairo(
                                        fontSize: 14, color: Color(0xff0012AA)),
                                  ),
                                  Text(
                                    '8:30 ص',
                                    style: GoogleFonts.cairo(
                                        fontSize: 14, color: Color(0xff0012AA)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'نوع التذكرة ',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    'رقم المقعد',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'عادية ',
                                    style: GoogleFonts.cairo(
                                        fontSize: 14, color: Color(0xff0012AA)),
                                  ),
                                  Text(
                                    'A1',
                                    style: GoogleFonts.cairo(
                                        fontSize: 14, color: Color(0xff0012AA)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'العنوان',
                                style: GoogleFonts.cairo(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller
                                    .reservationsItem.value[index].address,
                                style: GoogleFonts.cairo(
                                    fontSize: 14, color: Color(0xff0012AA)),
                              ),
                              Divider(),
                              /*      Align(
                  alignment: AlignmentDirectional.center,
                  child: Image(
                  image: AssetImage('images/cock.png'),
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                  alignment: AlignmentDirectional.center),
                  ),*/

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CustomDialog(
                                                index: index,
                                                buttonText2: 'لا اريد',
                                                title:
                                                    "هل انت متاكد من انك تريد الغاء التذكرة؟",
                                                discraption: "",
                                                buttonText: "نعم أريد",
                                                image: Image.network(
                                                    "images/h2.png"));
                                          });
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.delete_outline,
                                          color: Color(0xff0012AA),
                                        ),
                                        Text(
                                          'الغاء ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        size: 20,
                                        color: Color(0xff0012AA),
                                      ),
                                      Text(
                                        'تعديل  ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () => _showBottomSheet(),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.share,
                                          color: Color(0xff0012AA),
                                        ),
                                        Text(
                                          'تصدير ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: controller.reservationsItem.value.length,
                  shrinkWrap: true,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error,size: 55),
                  Center(
                    
                    child: Text(
                      'لا يوجد تذاكر, احجز الان',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )
                ],
              );
      },
    );
  }

  void _showBottomSheet() async {
    String? langCode = await showModalBottomSheet<String>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'تصد ير التذكرة',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'images/face.png',
                            fit: BoxFit.fill,
                            height:
                                50, // فكرة تثبيت  حجم الكنتينر تبعت الصورة علشان النص ما يطلع فوق وينزل حسب حجم الصورة
                          ),
                          Image.asset(
                            'images/insta.png',
                            fit: BoxFit.fill,
                            height:
                                50, // فكرة تثبيت  حجم الكنتينر تبعت الصورة علشان النص ما يطلع فوق وينزل حسب حجم الصورة
                          ),
                          Image.asset(
                            'images/twiter.png',
                            fit: BoxFit.fill,
                            height:
                                50, // فكرة تثبيت  حجم الكنتينر تبعت الصورة علشان النص ما يطلع فوق وينزل حسب حجم الصورة
                          ),
                          Image.asset(
                            'images/whats.png',
                            fit: BoxFit.fill,
                            height:
                                50, // فكرة تثبيت  حجم الكنتينر تبعت الصورة علشان النص ما يطلع فوق وينزل حسب حجم الصورة
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
