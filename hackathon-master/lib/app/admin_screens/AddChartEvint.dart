import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hackathon_project/model/EventChart.dart';
import 'package:intl/intl.dart';

import '../../widgets/app_text_field.dart';

class AddChartEvint extends StatefulWidget {
  late String name;
  late String nameCompny;
  late int tickitPrice;
  late int numberOfTickit;

  AddChartEvint({
    required this.name,
    required this.nameCompny,
    required this.tickitPrice,
    required this.numberOfTickit,
  });

  @override
  State<AddChartEvint> createState() => _AddChartEvintState();
}

class _AddChartEvintState extends State<AddChartEvint> {
  var day = DateTime.daysPerWeek;
  var time = DateTime.now().timeZoneName;
  Map<int, String> weekdayName = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday"
  };


  final now = new DateTime.now();

  List<EventChart> list = [];
  List<List<EvintData>> evintsDate = [];
  List<TextEditingController> listOfController = [];
  List<List<TextEditingController>> listOfListController = [];
  List<List<TextEditingController>> listOfListtoDiscribtionController = [];


 late String formatter;



  @override
  void initState() {
    evintsDate.add([EvintData(describtion: 'asdasd', time: "8:20 am")]);
     formatter = DateFormat('yMd').format(now);
    list.add(EventChart(
        date: formatter,
        day: weekdayName[DateTime.now().weekday],
        evintsDate: evintsDate[0])
    );
    listOfController.add(TextEditingController());
    listOfListController.add([TextEditingController()]);
    listOfListtoDiscribtionController.add([TextEditingController()]);
    listOfListController[0][0].text = evintsDate[0][0].time;
    listOfListController[0][0].text = "write your ditails";
    listOfController[0].text =weekdayName[DateTime.now().weekday].toString() +" "+ formatter ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اضافة مخطط الفعالية",
          style: Theme.of(context).textTheme.headline4,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
              )),
        ],
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
            )),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children:[ Card(
              color: MediaQuery.of(context).platformBrightness == Brightness.light
                  ? Colors.white
                  : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.h),
              child: ExpansionTile(
                title: Row(
                  children: [
                    Container(
                      width: 280.w,
                      height: 44,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: listOfController[0],
                        decoration: InputDecoration(border: InputBorder.none,),
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                    )
                  ],
                ),
                children: evintsDate.map((e) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.timelapse,
                            color: Color(0xff3c48c5),
                            size: 25,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            height: 40.h,
                            width: 2.5.w,
                            decoration: BoxDecoration(
                                color: Color(0xff3c48c5),
                                borderRadius: BorderRadius.circular(5.r)),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(

                              keyboardType: TextInputType.text,
                              controller: listOfListController[index][e.length-1-index],
                              decoration: InputDecoration(border: InputBorder.none,),
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: listOfListtoDiscribtionController[index][e.length-1-index],
                              decoration: InputDecoration(border: InputBorder.none,),
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        ),
                      ),

                    ],
                  );
                }).toList(),
              ),
            ),
              SizedBox(height: 20.h,),
              TextButton(onPressed: (){



                  setState(() {
                    evintsDate.add([EvintData(describtion: 'write your ditails', time: formatter)]);
                     listOfListController.add([TextEditingController()]);
                    listOfListtoDiscribtionController.add([TextEditingController()]);
                    listOfListController[index+1][listOfListController.length-1].text ="8:20";
                    listOfListtoDiscribtionController[index+1][listOfListController.length-1].text = "write your ditails";

                    list.add(EventChart(
                    date: formatter,
                    day: weekdayName[DateTime.now().weekday + index],
                    evintsDate: evintsDate[index+1])
                );
              });
                },
                  child: Text("add day"))
            ]
          );
        },
      ),
    );
  }
}
