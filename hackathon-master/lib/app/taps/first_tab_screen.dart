import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/events.dart';
import '../admin_screens/details_event_admin_screen.dart';

class FirstTabScreen extends StatelessWidget {
  const   FirstTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return   Events(image:'https://picsum.photos/200/300',ticket_available: '30', title: 'فعاليات مهرجا صوة العرب', data: '2/2/2022', Reservation: '100',  onTap: () {

        },);

      },
    );
  }
}
