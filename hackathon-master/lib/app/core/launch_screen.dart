
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/Get/FirebaseController.dart';

import '../../datebase/prefs/prefs.dart';


class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);
  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  var controller = Get.put<FirebaseController>(FirebaseController());
  @override
  void initState() {
     super.initState();
    controller.getFaliasFromFirebase();
    Future.delayed(const Duration(seconds: 3), () {
      if(SharedPrefController().getValueFor('uId')!=null){
        controller.methodLoginWithUid(  context: context);
      }else{
        Navigator.pushReplacementNamed(context, '/on_boarding_screen');

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        alignment: Alignment.centerLeft,
         child:  Stack(
           alignment: Alignment.centerRight,
            children: [
              Image.asset('images/wegoLogo.png',width: 300,height: 300,),
              Text('ويجو',style: GoogleFonts.cairo(color: Colors.black,fontSize: 35),),

            ],
          )
    ),);
  }
}
