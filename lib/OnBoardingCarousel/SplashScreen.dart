// ignore_for_file: prefer_const_constructors

import 'package:alamaapp/OnBoardingCarousel/OnboardingCarousel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to OnboardingCarousel after 3 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboardingcarousel()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(94, 48, 35, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 250,
          ),
          Text('Alama App',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 200,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(193, 133, 83, 0.12),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(250))),
            ),
          )
        ],
      ),
    );
  }
}
