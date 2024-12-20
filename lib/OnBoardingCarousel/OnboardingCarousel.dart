// ignore_for_file: file_names

import 'package:alamaapp/LoginSignUp/Login.dart';
import 'package:alamaapp/LoginSignUp/SignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboardingcarousel extends StatelessWidget {
  final Color kDarkBlueColor = const Color.fromARGB(255, 83, 45, 8);

  const Onboardingcarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Register',
      onFinish: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const SignUpPage(),
          ),
        );
      },
      finishButtonTextStyle:
          GoogleFonts.poppins(color: Colors.white, fontSize: 20),
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
            builder: (context) => const LoginPage(),
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
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/222.png',
          height: 400,
          width: 400,
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/333.png',
          height: 400,
          width: 400,
          fit: BoxFit.cover,
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
                height: 450,
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
                height: 450,
              ),
              Text(
                'Seamless Payments',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: kDarkBlueColor,
                  fontSize: 33.0,
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
