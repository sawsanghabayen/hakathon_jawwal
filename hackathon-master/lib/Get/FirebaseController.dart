import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hackathon_project/model/EventChart.dart';
import 'package:hackathon_project/model/FaliaModel.dart';
import 'package:hackathon_project/model/UserModle.dart';

import '../datebase/prefs/prefs.dart';

class FirebaseController extends GetxController {


  static FirebaseController get to => Get.find();
  var stateCreateAccount = "";
  var userModel = UserModle();
  var falias = <FaliaModel>[].obs;
  var  thqafa = <FaliaModel>[].obs;

  Future<bool> methodLogin({
    required String email,
    required String password,
  }) async {
    try {
      var crid = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var user = await FirebaseFirestore.instance
          .collection('users')
          .doc(crid.user!.uid)
          .get();
      userModel = UserModle.fromJson(user.data()!);
      SharedPrefController().save(uId: crid.user!.uid);
      return true;
    } catch (ex) {
      print(ex.toString());
      return false;
    }
  }

  Future<bool> methodLoginWithUid({required BuildContext context}) async {
    try {
      var user = await FirebaseFirestore.instance
          .collection('users')
          .doc(SharedPrefController().getValueFor('uId'))
          .get();
      userModel = UserModle.fromJson(user.data()!);
      print('object');
      Navigator.pushReplacementNamed(context, '/btn_navigation_screen');

      return true;
    } catch (ex) {
      print(ex.toString());
      return false;
    }
  }


  Future<bool> methodCreateAccount({required UserModle userModle}) async {
    try {
      var crid = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userModle.email, password: userModle.password);
      var user = await FirebaseFirestore.instance
          .collection('users')
          .doc(crid.user!.uid)
          .set(UserModle.toMap(userModle));
      this.userModel = userModle;
      SharedPrefController().save(uId: crid.user!.uid);
      return true;
    } catch (ex) {
      return false;
    }
  }

   getFaliasFromFirebase() async {
    falias.clear();
  try{
    falias.clear();
   var fal = await FirebaseFirestore.instance.collection('Falias').get();


      for(var element in fal.docs){
     var eventChart = await getEvintCharts(faliaId:element.id );
     print(eventChart!.length);
        FaliaModel fa = FaliaModel(
          id: element.id,
         name: element['name'],
         type: element['type'],
         location: element['location'],
         companyName: element['companyName'],
         ticketPrice: int.parse(element['ticketPrice'].toString()),
         numberOfTickets: int.parse(element['numberOfTickets'].toString()),
         aboutCompany: element['aboutCompany'],
         faliaDescrebtion: element['faliaDescrebtion'],
         eventchart:eventChart,
         imagesUrl: element.get('imagesUrl') as List<dynamic>);
       falias.add(fa);
       print(fa.type+"ASDASDASD");
       if(fa.type=="فعاليات الثقافة"){
         thqafa.add(fa);
       }


   }

 }catch (ex){
    print(ex.toString());

 }

  }
  Future<List<EventChart>?> getEvintCharts({required String faliaId}) async {
    var eventChartArray = <EventChart>[];
    try {
      var arr = await FirebaseFirestore.instance
          .collection('Falias')
          .doc(faliaId)
          .collection('EventChart')
          .get();
      for (var i in arr.docs) {
        var aw = await getEvintData(faliaId: faliaId, evintChartsId: i.id);
        var evintChart =
            EventChart(date: i['date'], day: i['day'], evintsDate: aw);
        eventChartArray.add(evintChart);
        return eventChartArray;
      }
    } catch (ex) {}
  }

  Future<List<EvintData>?> getEvintData({
    required String faliaId,
    required String evintChartsId,
  }) async {
    List<EvintData> evintDataArray = [];

    try {
      var ats = await FirebaseFirestore.instance
          .collection('Falias')
          .doc(faliaId)
          .collection('EventChart')
          .doc(evintChartsId)
          .collection('EvintData')
          .get();
      ats.docs.forEach((element) {
        print(element.data());
        var e = EvintData(
            time: element['time'], describtion: element['describtion']);
        evintDataArray.add(e);
      });
      return evintDataArray;
    } catch (ex) {}
  }


  RxList<FaliaModel> fillterEvints({required String fillterBy}){
   var a = falias;
    RxList<FaliaModel> newArray = <FaliaModel>[].obs;
     a.forEach((element) {
       print(element);
      if(element.type.contains(fillterBy)){
        newArray.add(element);
      }
    });

return newArray;
  }


}
