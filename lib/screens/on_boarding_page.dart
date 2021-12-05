import 'package:capstone/common/styles.dart';
import 'package:capstone/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  List<PageViewModel> listPages() {
    return [
      PageViewModel(
        image: Image.asset('assets/undraw_High_five_re_jy71.png'),
        title: 'Vaksinasi Covid-19',
        body:
            'Lindungi diri dan sekitar dengan mengikuti protokol kesehatan dan program vaksinasi Covid-19!',
        footer: Image.asset(
          'assets/logo_vacare.png',
          height: 23,
        ),
      ),
      PageViewModel(
        image: Image.asset('assets/undraw_medical_research_qg4d.png'),
        title: 'Program Vaksinasi',
        body:
            'Temukan lokasi penyedia program vaksinasi Covid-19 dengan mudah!',
        footer: Image.asset(
          'assets/logo_vacare.png',
          height: 23,
        ),
      ),
      PageViewModel(
        image: Image.asset('assets/undraw_healthy_options_sdo3.png'),
        title: 'Informasi Vaksinasi',
        body:
            'Nikmati kemudahan mengakses informasi terkait vaksinasi Covid-19!',
        footer: Image.asset(
          'assets/logo_vacare.png',
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
        skip: Text('Skip'),
        next: Icon(Icons.arrow_forward),
        done: Text('Done'),
        showSkipButton: true,
        showDoneButton: true,
        controlsMargin: EdgeInsets.all(16),
        controlsPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        pages: listPages(),
        globalBackgroundColor: Colors.white,
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
