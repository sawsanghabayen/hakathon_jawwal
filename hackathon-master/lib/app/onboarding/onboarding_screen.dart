import 'package:flutter/material.dart';

import '../../datebase/prefs/prefs.dart';
import '../../widgets/default_button.dart';
import '../../widgets/on_boarding_content.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    if (SharedPrefController().getValueFor('isShown')==true) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    }


    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: BouncingScrollPhysics(),
                // physics: ClampingScrollPhysics(),
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int currentPage) {
                  // print('currentPage:$currentPage');
                  // print('page:${_pageController.page}');
                  setState(() => _currentPage = currentPage);
                },
                children: [
                  OnBoardingContent(
                    imageName: 'boarding1.png',
                    title: 'كل الفعاليات في مكان واحد',
                    description:
                        'معنا تستطيع متابعة كل الفعاليات من حولك فور  الاعلان عنها و اختيار ما يناسب رغباتك في اي مكان تريد الذهاب اليه',
                  ),
                  OnBoardingContent(
                    imageName: 'boarding2.png',
                    title: 'احجز تذكرتك بكل سهوله',
                    description:
                        '''معنا تستطيع متابعة كل الفعاليات من حولك فور الاعلان عنها و اختيار ما يناسب رغباتك في اي مكان تريد الذهاب اليه
''',
                  ),
                  OnBoardingContent(
                    imageName: 'boarding3.png',
                    title: 'الوصول اسهل',
                    description:
                        '''معنا تستطيع الوصول ال مكان الفعالية بشكل مباشر وسهل ومندون جهد او تعب ومن دون ما تسال حد ويضيعك من خلال الخريطة
''',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelectorIndicator(
                  backgroundColor:
                      _currentPage == 0 ? Colors.blue : Colors.grey,
                  borderColor: _currentPage == 0 ? Colors.blue : Colors.grey,
                  size: 10,
                ),
                TabPageSelectorIndicator(
                  backgroundColor:
                      _currentPage == 1 ? Colors.blue : Colors.grey,
                  borderColor: _currentPage == 1 ? Colors.blue : Colors.grey,
                  size: 10,
                ),
                TabPageSelectorIndicator(
                  backgroundColor:
                      _currentPage == 2 ? Colors.blue : Colors.grey,
                  borderColor: _currentPage == 2 ? Colors.blue : Colors.grey,
                  size: 10,
                ),
              ],
            ),
            Visibility(
              visible: _currentPage < 2,
              replacement: TextButton(
                onPressed: () {
                  SharedPrefController()
                      .saveBool(key: "isShown", boolean: true);

                  Navigator.pushReplacementNamed(context, '/login_screen');
                },
                child: DefaultButton(
                  text: "تخطي",
                  press: () {
                    SharedPrefController()
                        .saveBool(key: "isShown", boolean: true);
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                ),
              ),
              child: TextButton(
                  onPressed: () {
                    _pageController.animateToPage(2,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOutBack);
                  },
                  style: TextButton.styleFrom(),
                  child: Icon(
                    Icons.arrow_forward_ios,
                  )),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
