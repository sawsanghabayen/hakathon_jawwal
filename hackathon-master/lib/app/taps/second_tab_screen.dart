import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hackathon_project/Get/FirebaseController.dart';
import 'package:hackathon_project/app/home_screen/details_screen.dart';

import '../../widgets/events.dart';
import '../admin_screens/details_event_admin_screen.dart';

class SecondTabScreen extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return GetX<FirebaseController>(
      builder: (c){
         return ListView.builder(
          itemCount: c.falias.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Events(image:c.falias[index].imagesUrl![0],
              ticket_available:(((17+index)*4)/3).toInt().toString(),
              title: c.falias[index].name,
              data: c.falias[index].eventchart![0].date.toString(),
              Reservation:  c.falias[index].numberOfTickets.toString(),  onTap: () {
              Get.to(
                  DetailsScreen(falia: c.falias[index])
              );
            },);
          },
        );
      },
    );
  }
}
