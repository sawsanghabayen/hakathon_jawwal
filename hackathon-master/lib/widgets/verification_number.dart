import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationNumberItem extends StatelessWidget {
  const VerificationNumberItem({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
    this.lastItem = false,
    this.firstItem = false,
  }) : super(key: key);
  final Color backgroundColor, borderColor;

  final bool lastItem, firstItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      width: 68.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),


      ),
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
fillColor: backgroundColor,
          filled: true,

          border: OutlineInputBorder(
borderRadius:BorderRadius.circular(25.r),

              borderSide:   BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color:backgroundColor,
              )),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.length == 1 && !lastItem) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && !firstItem) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
