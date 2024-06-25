import 'package:alamaapp/IntroductionPage.dart';
// import 'package:example/screens/login_page.dart';
// import 'package:example/screens/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final Color kDarkBlueColor = const Color(0xFF053149);

  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Register',
      onFinish: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const IntroductionPage(
              title: '',
            ),
          ),
        );
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: kDarkBlueColor,
      ),
      skipTextButton: Text(
        'Skip',
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        'Login',
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const IntroductionPage(
              title: '',
            ),
          ),
        );
      },
      controllerColor: kDarkBlueColor,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Image.asset(
          'assets/111.png',
          height: 400,
          width: 400,
        ),
        Image.asset(
          'assets/222.png',
          height: 400,
          width: 380,
        ),
        Image.asset(
          'assets/333.png',
          height: 400,
          width: 360,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Welcome to Alama',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: kDarkBlueColor,
                  fontSize: 34.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Discover the finest Tanzanian cuisine and enjoy a seamless dining experience',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.blueGrey,
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Easy Ordering.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: kDarkBlueColor,
                  fontSize: 34.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Browse our extensive menu and place your order with just few taps',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.blueGrey,
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Seamless Payments',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Choose from a variety of payment options, including Lipa no and cash.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.blueGrey,
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
