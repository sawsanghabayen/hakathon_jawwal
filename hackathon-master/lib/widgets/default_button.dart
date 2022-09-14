import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.w,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          primary: Colors.white,
          backgroundColor: Color(0xFF2940FF),
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: Theme.of(context).textTheme.headline4?.copyWith(
               color: Colors.white
          ),
        ),
      ),
    );
  }
}
