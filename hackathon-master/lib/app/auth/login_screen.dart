import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/Get/FirebaseController.dart';
import 'package:hackathon_project/app/admin_screens/home_admin_Screen.dart';
import 'package:hackathon_project/app/bottom_navigation_screen.dart';

import '../../widgets/app_text_field.dart';
import '../../widgets/default_button.dart';
import '../../widgets/helpers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  var controller = Get.put<FirebaseController>(FirebaseController());

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();

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
                  height: 462.h,
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
                      'البريد الالكتروني',
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: AppTextField(
                    hint: "ادخل رقم الجوال",
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTextController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, right: 16),
                  child: Align(
                    child: Text(
                      'كلمة السر',
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                      ),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: AppTextField(
                    hint: "ادخل رقم الجوال",
                    prefixIcon: Icons.password,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordTextController,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefaultButton(
                        text: "تسجيل دخول",
                        press: () => _performLogin(),
                      ),
                    ),
                    // SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/create_screen');
                              },
                              child: Text('تسجيل جديد ')),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  Future<void> _performLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'أدخل البيانات المطلوبة', error: true);
    return false;
  }

  Future<void> _login() async {
    bool isLogged = await controller.methodLogin(
        email: _emailTextController.text,
        password: _passwordTextController.text);


    if (isLogged) {
      if(controller.userModel.email.toString().split("@")[0]=="admin"){
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Get.to(
                () {
              return BTNScreen();
            },
          );
        });
      }else{
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Get.to(
                () {
              return BottomNavigationScreen();
            },
          );
        });
      }
    } else {
      // context.showSnackBar(message: 'تأكد من معلومات حسابك', error: !isLogged);
    }
  }
}