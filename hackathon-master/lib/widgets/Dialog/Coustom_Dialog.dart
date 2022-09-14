import 'package:flutter/material.dart';
import 'package:hackathon_project/helper/context_extenssion.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/Get/reservations_get_controller.dart';
import '../../model/api_response.dart';

class Const {
  static double padding = 16;
  static double avatarRadius = 66;

  Const._();
}

class CustomDialog extends StatelessWidget {
  final int index;
  ReservationsGetxController controller =Get.put(ReservationsGetxController());
   CustomDialog(
      {Key? key,
      required this.index,
      required this.title,
      required this.discraption,
      required this.buttonText,
      required this.image,
      required this.buttonText2})
      : super(key: key);
  final String title, discraption, buttonText, buttonText2;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Const.padding)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: diallogContent(context,index:index),
    );
  }

  diallogContent(BuildContext context, {required int index}) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: Const.avatarRadius + Const.padding,
          ),
          margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 120),
              Text(title, style: GoogleFonts.getFont('Cairo')),
              const SizedBox(
                height: 10,
              ),
              const Divider(height: 8, color: Colors.black, thickness: 0.3),
              Align(
                alignment: Alignment.center,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: TextButton(
                          child: Text(buttonText,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.getFont('Cairo')),
                          onPressed: () async{
                            ProcessResponse process=await controller.deleteItem(index);
                            // Navigator.push(context);
                            context.showSnackBar(message: process.message,error: !process.success);
                            print(process.success);
                            print(process.message);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 0.3,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 25),
                        child: TextButton(
                          child: Text(buttonText2,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.getFont('Cairo')),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 15,
          right: Const.padding,
          child: Image.asset('images/Haret.png'),
        ),
      ],
    );
  }
}
