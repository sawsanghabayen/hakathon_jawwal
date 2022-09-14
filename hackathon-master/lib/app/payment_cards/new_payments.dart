
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/Get/FirebaseController.dart';
import 'package:hackathon_project/model/payment.dart';
import 'package:hackathon_project/widgets/helpers.dart';
import 'package:intl/intl.dart';

import '../../Get/FirebaseController.dart';
import '../../datebase/prefs/prefs.dart';


class NewPaymentsScreen extends StatefulWidget {
  const NewPaymentsScreen({Key? key}) : super(key: key);

  @override
  State<NewPaymentsScreen> createState() => _NewPaymentsScreenState();
}

class _NewPaymentsScreenState extends State<NewPaymentsScreen> with Helpers{
  // CardGetxController controller = Get.put(CardGetxController());

  late PageController _pageController;

  late TextEditingController _cardNumTextController;
  late TextEditingController _expirationTextController;
  late TextEditingController _holderNameTextController;
  late TextEditingController _cvvTextController;

  DateTime _date = DateTime.now();

  // final List<PaymentCards> _paymentcards = <PaymentCards>[
  //   const PaymentCards(id: 1, title: 'PayPal'),
  //   const PaymentCards(id: 2, title: 'Visa'),
  //   const PaymentCards(id: 3, title: 'Master Card'),
  // ];
  // late int? _selectedCityId = 1;
  String _typeCard = 'Visa';

  @override
  void initState() {
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // controller.getAllCards();


    });
    super.initState();
    _cardNumTextController = TextEditingController();
    _expirationTextController = TextEditingController();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);

    _holderNameTextController = TextEditingController();
    _cvvTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cardNumTextController.dispose();
    _expirationTextController.dispose();
    _holderNameTextController.dispose();
    _cvvTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'اضافة بطاقة',
          style: GoogleFonts.cairo(color: Colors.black),
          // fontSize: 20.sp,
          // color: Color(0xFF3E3E3E),
          // fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body:

      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Color(0xFFFFFFFF),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.w, vertical: 18.h),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      TextField(
                        autofocus: true,
                        controller: _cardNumTextController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 15.h),
                          hintText: 'أدخل رقم البطاقة',
                          hintStyle: GoogleFonts.nunito(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFCACACA)),
                          hintMaxLines: 1,
                          // prefixIcon: Icon(prefixIcon),
                          // suffixIcon: Icon(Icons.) ,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(.5.r),
                            borderSide: BorderSide(
                                color: Color(0xFFEDF1F7)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(.5.r),
                            borderSide: BorderSide(
                                color: Color(0xFF2940FF)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),

                      TextField(
                        autofocus: true,
                        controller: _holderNameTextController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 15.h),
                          hintText: 'أدخل الاسم على البطاقة',
                          hintStyle: GoogleFonts.nunito(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFCACACA)),
                          hintMaxLines: 1,
                          // prefixIcon: Icon(prefixIcon),
                          // suffixIcon: Icon(Icons.) ,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.5.r),
                            borderSide: BorderSide(
                                color: Color(0xFFEDF1F7)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.5.r),
                            borderSide: BorderSide(
                                color: Color(0xFF2940FF)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),

                      Row(
                        children: [
                          SizedBox(
                            width: 150.w,
                            child: TextField(
                              autofocus: true,
                              controller: _cvvTextController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 14.w, vertical: 15.h),
                                hintText: 'ادخل CVV',
                                hintStyle: GoogleFonts.nunito(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFCACACA)),
                                hintMaxLines: 1,
                                // prefixIcon: Icon(prefixIcon),
                                // suffixIcon: Icon(Icons.) ,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.5.r),
                                  borderSide:
                                  BorderSide(color: Color(0xFFEDF1F7)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.5.r),
                                  borderSide:
                                  BorderSide(color: Color(0xFF2940FF)),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                              width: 150.w,
                              child: GestureDetector(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: Container(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat('yyyy-MM-dd')
                                            .format(_date),
                                        /* fontSize: 14.sp*/),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.date_range,
                                              color: Colors.grey))
                                    ],
                                  ),

                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border:
                                    Border.all(color: Color(0xff2940FF)),
                                    borderRadius: BorderRadius.circular(
                                        .5.r),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 20.h,),

                      Text(
                        'نوع البطاقة',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.normal,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 20.h,),

                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                                title: Text(
                                  'فيزا',
                                  style: GoogleFonts.nunito(),
                                ),
                                value: 'Visa',
                                activeColor: Color(0xff2940FF),
                                groupValue: _typeCard,
                                onChanged: (String? value) {
                                  setState(() => _typeCard = value!);
                                }),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                                title: Text(
                                  'ماستر',
                                  style: GoogleFonts.nunito(),
                                ),
                                value: 'Master',
                                activeColor: Color(0xff2940FF),
                                groupValue: _typeCard,
                                onChanged: (String? value) {
                                  setState(() => _typeCard = value!);
                                }),
                          ),
                        ],
                      ),
                      Spacer(),

                      ElevatedButton(

                          onPressed: ()   async{
                           await addPayment();
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(343.w, 48.h),
                              primary: Color(0xff2940FF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      6.r))),
                          child: Text(
                            'اضافة',
                            style: GoogleFonts.nunito(
                                fontSize: 16.sp,
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(height: 50.h,),

                      // SizedBox()
                    ]),
              ),
            ),
          ),
        ],
      ),
      // },
      // ),
    );
  }
  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      context: context,
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _expirationTextController.text = formattedDate;
        _date = pickedDate;
        // DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }


  _performAddPayment()async{
    if(checkedData()){
      await addPayment();
    }
  }
  bool checkedData(){
    if(_expirationTextController.text.isNotEmpty &&
        _cvvTextController.text.isNotEmpty &&
        _cardNumTextController.text.isNotEmpty &&
        _holderNameTextController.text.isNotEmpty && _typeCard!=null){
      return true;

    }

    return false;
  }

  Future<void> addPayment()async{
    // bool isSuccess=await   FirebaseController.to.createPaymentMethod(getPayment());
    // if(isSuccess){
    //   clearText();
    //   Navigator.pop(context);
    // }
  }
  void clearText() {
    _holderNameTextController.clear();
    _cardNumTextController.clear();
    _expirationTextController.clear();
    _cvvTextController.clear();
  }
  Payment getPayment(){
    String userId=SharedPrefController().getValueFor<String>('uId')!;
    Payment payment=Payment();
    payment.holderName=_holderNameTextController.text;
    payment.userId=userId;
    payment.cardNumber=_cardNumTextController.text;
    payment.expDate=_expirationTextController.text;
    payment.cvv=_cvvTextController.text;
    payment.type=_typeCard;

    return payment;
  }

}