import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardsPayments extends StatelessWidget {
  const CardsPayments({
    Key? key,
    required this.holderName,
    required this.date,
    required this.cvv,
    required this.cardNum,
    required this.image,
    required this.color,

  }) : super(key: key);
  final String image;
  final String holderName;
  final String date;
  final String cardNum;
  final String cvv;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 24.94.h),
      child: Stack(
        children: [
       Image.asset('images/visacard.png')
        ],


      ),
    );

  }
}