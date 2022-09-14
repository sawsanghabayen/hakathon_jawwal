import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/Get/FirebaseController.dart';

import '../../../widgets/adding_row.dart';
import '../../admin_screens/AddChartEvint.dart';
import '../../admin_screens/home_admin_Screen.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  DateTime dateStart = DateTime(2022, 9, 12);
  DateTime dateEnd = DateTime(2022, 9, 12);
  var eventNameController = TextEditingController();
  var eventNameCompuneController = TextEditingController();
  var eventtickitPriceController = TextEditingController();
  var eventtickitNumberController = TextEditingController();
  var eventtickitStartDataController = TextEditingController();
  var eventtickitFinishDataController = TextEditingController();
  var eventWoryController = TextEditingController();
  final Color customColor = Colors.blue;
var controller = Get.put<FirebaseController>(FirebaseController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('اضافة فعالية '),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              'اسم الفعالية ',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: customColor),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'أضف اسم الفعالية',
              ),
              controller: eventNameController,

            ),
            Text(
              'الراعي الرسمي ',
              style: GoogleFonts.cairo(color: customColor),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'اضف اسم الراعي الرسمي',
              ),
              controller: eventNameCompuneController,
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: MediaQuery
                  .of(context)
                  .platformBrightness == Brightness.light
                  ? Colors.white
                  : Colors.black,
              elevation: 3,
              shadowColor: customColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Adding_row(
                  Title: 'سعر التذكرة العادية',
                ),
              ),
            ),
            Card(color: MediaQuery
                .of(context)
                .platformBrightness == Brightness.light ? Colors.white : Colors
                .black,
              elevation: 3,
              shadowColor: customColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Adding_row(
                  Title: 'عدد  التذاكر  ',
                ),
              ),
            ),


            Card(
              elevation: 3, color: MediaQuery
                .of(context)
                .platformBrightness == Brightness.light ? Colors.white : Colors
                .black,
              shadowColor: customColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: dateStart,
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2023));
                          if (newDate == null) return;
                          setState(() {
                            dateStart = newDate;
                          });
                        },
                        child: Text('تاريخ البدء')),
                    IconButton(onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: dateStart,
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2023));
                      if (newDate == null) return;
                      setState(() {
                        dateStart = newDate;
                      });
                    }, icon: Icon(Icons.edit)),
                    Spacer(),
                    Text(
                        '${dateStart.year}/${dateStart.month}/${dateStart.day}')
                  ],
                ),
              ),
            ),

            Card(
              color: MediaQuery
                  .of(context)
                  .platformBrightness == Brightness.light
                  ? Colors.white
                  : Colors.black,
              elevation: 3,
              shadowColor: customColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: dateEnd,
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2023));
                          if (newDate == null) return;
                          setState(() {
                            dateEnd = newDate;
                          });
                        },
                        child: Text('تاريخ الانتهاء')),
                    IconButton(onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: dateEnd,
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2023));
                      if (newDate == null) return;
                      setState(() {
                        dateEnd = newDate;
                      });
                    }, icon: Icon(Icons.edit)),

                    Spacer(),
                    Text('${dateEnd.year}/${dateEnd.month}/${dateEnd.day}')
                  ],
                ),
              ),
            ),

            Text(
              'وصف الفعالية',
              style: GoogleFonts.cairo(color: customColor),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'وصف الفعالية',
              ),
              controller: eventWoryController,

            ),
            SizedBox(height: 30.h,),
            ElevatedButton(
            onPressed: (){
       FirebaseFirestore.instance.collection('Falias')
           .add({
         'aboutCompany': 'مركز القطان للثقافة',
         'companyName': 'مركز القطان ',
         'faliaDescrebtion': eventWoryController.text,
         'imagesUrl': ["https://www.sayidaty.net/sites/default/files/styles/900_scale/public/2019/05/08/5253196-1867233831.jpg",
           "https://www.sayidaty.net/sites/default/files/styles/900_scale/public/2019/05/08/5253196-1867233831.jpg",
           "https://www.sayidaty.net/sites/default/files/styles/900_scale/public/2019/05/08/5253196-1867233831.jpg",
           "https://www.sayidaty.net/sites/default/files/styles/900_scale/public/2019/05/08/5253196-1867233831.jpg"
         ],
         'location':"غزة",
         'name': eventNameController.text,
         'numberOfTickets': 50,
         'ticketPrice':90,
         'type': "أحدث الفعاليات  فعاليات الثقافة أشهر الفعاليات",
       }).then((value){
        Future.delayed(Duration(seconds: 2),
        () {
          Get.to(BTNScreen());
        },
        );
       });

      }, child: Text('اضافة'), style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50.h),
      ),)
      ],
    ),)
    ,
    )
    ,
    );
  }
}
