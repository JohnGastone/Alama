// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:alamaapp/OnBoardingCarousel/OnboardingCarousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Timer? _timer;
  int _start = 8;
  @override
  void initState() {
    super.initState();
    startTimer();
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboardingcarousel()),
      );
    });
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer?.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String get timerText {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(94, 48, 35, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Image.asset(
            "./assets/ala.png",
            width: 200,
            height: 200,
          ),
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " In",
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    timerText,
                    style:
                        GoogleFonts.poppins(fontSize: 18, color: Colors.brown),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    " you will be inside Alama",
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
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
