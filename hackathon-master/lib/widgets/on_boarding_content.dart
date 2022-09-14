import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.imageName,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String imageName;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(

                child: Image.asset(
                  'images/assets/$imageName',
                  fit: BoxFit.fill,
                ),
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                height: 20.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),

              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.cairo(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(
                    height: 20.8,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.headline5
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
