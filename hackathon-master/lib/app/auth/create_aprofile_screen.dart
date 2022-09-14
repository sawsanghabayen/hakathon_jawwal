import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/model/UserModle.dart';

import '../../Get/FirebaseController.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/default_button.dart';
import '../../widgets/helpers.dart';

class CreateAprofileScreen extends StatefulWidget {
  const CreateAprofileScreen({Key? key}) : super(key: key);

  @override
  State<CreateAprofileScreen> createState() => _CreateAprofileScreenState();
}

class _CreateAprofileScreenState extends State<CreateAprofileScreen>
    with Helpers {
  late TextEditingController _emailTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _phoneTextController;
  bool _obscure = true;

  String _gender = 'M';
  int? _cityId;
  var controller = Get.put<FirebaseController>(FirebaseController());

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _phoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _nameTextController.dispose();
    _passwordTextController.dispose();
    _phoneTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Text(
              "اكمل ملفك الشخصي",
              style: GoogleFonts.cairo(
                // fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            CircleAvatar(
              maxRadius: 58,
              backgroundImage: AssetImage("images/assets/boarding1.png"),
            ),
            SizedBox(height: 36.h),
            AppTextField(
              hint: "ادخل اسم المستخدم كامل ",
              prefixIcon: Icons.person,
              keyboardType: TextInputType.text,
              controller: _nameTextController,
            ),
            SizedBox(height: 36.h),
            AppTextField(
              hint: "ادخل بريدك الاكتروني ",
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              controller: _emailTextController,
            ),
            SizedBox(height: 36.h),
            AppTextField(
              hint: "ادخل كلمة السر",
              prefixIcon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordTextController,
            ),
            SizedBox(height: 36.h),
            AppTextField(
              hint: "ادخل رقم الهاتف",
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
              controller: _phoneTextController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text(
                            'ذكر',
                            style: GoogleFonts.cairo(),
                          ),
                          value: 'M',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() => _gender = value);
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: Text(
                            'انثي',
                            style: GoogleFonts.cairo(),
                          ),
                          value: 'F',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            if (value != null) {
                              setState(() => _gender = value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: double.infinity,
                        child: DefaultButton(
                          text: "حفظ البيانات",
                          press: () => _performRegister(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performRegister() async {
    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data', error: true);
    return false;
  }

  Future<void> _register() async {
    var userModel = UserModle();
    userModel.phone = _phoneTextController.text;
    userModel.email = _emailTextController.text;
    userModel.fullName = _nameTextController.text;
    userModel.password = _passwordTextController.text;
    userModel.imageUrl =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiwVJV38db9e6c6qLcHw53zMFT9j81nnv13Go8rzlOSA&s';

    userModel.isMeal = _gender == 'M';

    var isRegesterd = await controller.methodCreateAccount(
        userModle: userModel);
    if (isRegesterd) {
      Navigator.pushReplacementNamed(context, '/btn_navigation_screen');

    }else {
      // context.showSnackBar(message: 'error', error: false);
    }}
}
