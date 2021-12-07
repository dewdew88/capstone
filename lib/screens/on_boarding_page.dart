import 'package:capstone/common/styles.dart';
import 'package:capstone/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  List<PageViewModel> listPages() {
    return [
      PageViewModel(
        image: Image.asset('assets/images/undraw_high_five_re_jy71 1.png'),
        title: ('Vaksinasi Covid-19'),
        body:
            'Lindungi diri dan sekitar dengan mengikuti protokol kesehatan dan program vaksinasi Covid-19!',
        footer: Image.asset(
          'assets/images/logo_vacare.png',
          height: 23,
        ),
      ),
      PageViewModel(
        image: Image.asset('assets/images/undraw_medical_research_qg4d 1.png'),
        title: 'Program Vaksinasi',
        body:
            'Temukan lokasi penyedia program vaksinasi Covid-19 dengan mudah!',
        footer: Image.asset(
          'assets/images/logo_vacare.png',
          height: 23,
        ),
      ),
      PageViewModel(
        image: Image.asset('assets/images/undraw_healthy_options_sdo3 1.png'),
        title: 'Informasi Vaksinasi',
        body:
            'Nikmati kemudahan mengakses informasi terkait vaksinasi Covid-19!',
        footer: Image.asset(
          'assets/images/logo_vacare.png',
          height: 23,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        skipFlex: 0,
        nextFlex: 0,
        skip: Text('Skip', style: Theme.of(context).textTheme.bodyText1!),
        next: Icon(
          Icons.arrow_forward,
        ),
        done: Text('Done', style: Theme.of(context).textTheme.bodyText1!),
        showSkipButton: true,
        showDoneButton: true,
        controlsMargin: EdgeInsets.all(16),
        controlsPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        pages: listPages(),
        onDone: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => MainPage(),
            ),
          );
        },
        dotsDecorator: DotsDecorator(
          size: Size(10, 10),
          activeSize: Size(40, 10),
          color: Color(0xFFFF9D43),
          activeColor: secondaryColor,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
        dotsContainerDecorator: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
