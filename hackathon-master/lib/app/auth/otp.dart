import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/app_text_field.dart';
import '../../widgets/default_button.dart';
class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  late TextEditingController _mobileTextController;

  @override
  void initState() {
    super.initState();
    _mobileTextController = TextEditingController();


  }

  @override
  void dispose() {
    _mobileTextController.dispose();


    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
       body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 99.h,
                child: Image.asset(
                  'images/assets/boarding1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, right: 16),
                child: Align(
                  child: Text(
                    'التحقق من رقم الجوال',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, right: 16,bottom: 20),
                child: Align(
                  child: Text(
                    'لقد أرسلنا إليك رسالة نصية قصيرة تحتوي على رمز التحقق إلى رقمك 9665211043+ تعديل',
                    style: Theme.of(context).textTheme.headline6?.copyWith(

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: AppTextField(
                  hint: "ادخل كود التحقق",
                  prefixIcon: Icons.phone_android_outlined,
                  keyboardType: TextInputType.phone,
                  controller: _mobileTextController,
                ),
              ),

              Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                    child: DefaultButton(
                      text: "ابدا",
                      press: () {

                        Navigator.pushNamed(context, '/btn_navigation_screen');
                      },
                    ),
                  ),
                  // SizedBox(height: 10),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'اعادة الارسال',
                              style: Theme.of(context).textTheme.bodyText2?.copyWith(

                                color: Colors.grey.shade700,
                              ),
                              children: [
                                TextSpan(text: ''),
                              ]),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
