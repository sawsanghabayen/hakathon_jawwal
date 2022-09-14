import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

 import '../../widgets/app_text_field.dart';
import '../../widgets/default_button.dart';
import '../../widgets/helpers.dart';

class EditAccount extends StatefulWidget {
  final String name;
  final String phone;
  final String email;
   EditAccount({Key? key,required this.phone,required this.email,required this.name}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> with Helpers {
  late TextEditingController _phoneTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;


  String _gender = 'M';
  int? _cityId;


  @override
  void initState() {
    super.initState();
    _phoneTextController = TextEditingController(text: widget.phone);
    _nameTextController = TextEditingController(text: widget.name);
    _emailTextController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _phoneTextController.dispose();
    _nameTextController.dispose();
    _emailTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Column(
              // crossAxisAlignment : CrossAxisAlignment.center,
              children: [

                SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/user.png"),
                      ),
                      Positioned(
                        right: -16,
                        bottom: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(color: Colors.white),
                              ),
                              primary: Colors.white,
                              backgroundColor: Color(0xFFF5F6F9),
                            ),
                            onPressed: () {},
                            child:  Icon(Icons.camera_alt_outlined,color: Colors.grey,),
                          ),
                        ),
                      )
                    ],
                  ),
                ),




              ],
            ),
            SizedBox(height: 36.h),
            Text('اسم المستخدم',),
            AppTextField(
              hint: "أكتب اسمك",
              prefixIcon: Icons.person,
              keyboardType: TextInputType.text,
              controller: _nameTextController,
            ),
            SizedBox(height: 26.h),
            Text('رقم الجوال',),
            AppTextField(
              hint: "+97000000000",
              prefixIcon: Icons.phone_android_outlined,
              keyboardType: TextInputType.phone,
              controller: _phoneTextController,
            ),
            SizedBox(height: 26.h),
            Text('البريد الاكتروني',),
            AppTextField(
              hint: "أكتب بريدك الالكتروني",
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              controller: _emailTextController,
            ),
            SizedBox(height: 203.h),


            SizedBox(
              width: 360.w,
              child: DefaultButton(
                text: "حفظ البيانات",
                press: () => _performRegister(),
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
        _phoneTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data', error: true);
    return false;
  }


  Future<void> _register() async {

  }

}

