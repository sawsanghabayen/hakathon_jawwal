import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/app/admin_screens/event_screen_edit.dart';
import 'package:hackathon_project/app/admin_screens/home_admin_Screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'app/core/launch_screen.dart';
import 'app/onboarding/onboarding_screen.dart';
import 'app/payment_cards/new_payments.dart';
import 'app/payment_cards/pay_screen.dart';
import 'app/payment_cards/payments.dart';
import 'app/praymary_screen/account_screen.dart';
import 'app/auth/create_aprofile_screen.dart';
import 'app/auth/login_screen.dart';
import 'app/auth/otp.dart';
import 'app/bottom_navigation_screen.dart';
import 'app/ticket/taps/basic_info_screen.dart';
import 'datebase/db_controller.dart';
import 'datebase/prefs/prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefController().initPreferences();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFF5F5F5),
            accentColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.grey[600], size: 22,),
            textTheme: TextTheme(
              headline1: GoogleFonts.averageSans(
                  fontSize: 24.sp, color: Colors.black87),
              headline2: GoogleFonts.averageSans(
                  fontSize: 22.sp, color: Colors.black87),
              headline3: GoogleFonts.averageSans(
                  fontSize: 20.sp, color: Colors.black87),
              headline4: GoogleFonts.averageSans(
                  fontSize: 18.sp, color: Colors.black87),
              headline5: GoogleFonts.averageSans(
                  fontSize: 16.sp, color: Colors.black87),
              headline6: GoogleFonts.averageSans(
                  fontSize: 14.sp, color: Colors.black87),
              bodyText2: GoogleFonts.averageSans(color: Colors.black87),
              bodyText1: GoogleFonts.averageSans(
                  color: Colors.black87, fontSize: 15.sp),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: GoogleFonts.averageSans(
                  fontSize: 14.sp,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500),
              border: InputBorder.none,
            ),
            cardColor: Color(0xff2c38b0),
          ),

          darkTheme: ThemeData(
            scaffoldBackgroundColor: Color(0xFF1C1C1C),
            accentColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.grey[400], size: 22),
            textTheme: TextTheme(
              headline1:
                  GoogleFonts.averageSans(fontSize: 24.sp, color: Colors.white),
              headline2:
                  GoogleFonts.averageSans(fontSize: 22.sp, color: Colors.white),
              headline3:
                  GoogleFonts.averageSans(fontSize: 20.sp, color: Colors.white),
              headline4:
                  GoogleFonts.averageSans(fontSize: 18.sp, color: Colors.white),
              headline5:
                  GoogleFonts.averageSans(fontSize: 16.sp, color: Colors.white),
              headline6:
                  GoogleFonts.averageSans(fontSize: 14.sp, color: Colors.white),
              bodyText2: GoogleFonts.averageSans(color: Colors.white),
              bodyText1:
                  GoogleFonts.averageSans(color: Colors.white, fontSize: 15.sp),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: GoogleFonts.averageSans(
                  fontSize: 14.sp,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500),
              border: InputBorder.none,
            ),
            cardColor: Color(0xff2c38b0),
          ),
          title: 'ويقو',
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          //********************* LOCALIZATION START *********************
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],

          locale: Locale('ar'),
          initialRoute: '/launch_screen',
          routes: {
            '/launch_screen': (context) => const LaunchScreen(),
            '/login_screen': (context) => const LoginScreen(),
            '/create_screen': (context) => const CreateAprofileScreen(),
            '/on_boarding_screen': (context) => const OnboardingScreen(),
            '/btn_navigation_screen': (context) =>
                const BottomNavigationScreen(),
            '/otp_screen': (context) => const OTP(),
            '/acount_screen': (context) => AccountScreen(),
            '/payments_screen': (context) => const Payments(),
            '/pay_screen': (context) => const PayScreen(),
            '/newpay_screen': (context) => const NewPaymentsScreen(),
            '/add_event': (context) => const AddEventScreen(),
            '/event_screen': (context) => EventsScreen(),
            '/home_admin_screen': (context) => const BTNScreen(),
          },
          navigatorKey: Get.key,
        );
      },
    );
  }
}

/**
 * height: 31
 * design Height: 812 = 8.12
 * current device height: 812 = 8.12
 *
 * Height on same (812) size: (31 * 8.12) / 8.12 = 31
 * Height on same (740) size: (31 * 7.4) / 8.12 = 28
 */
