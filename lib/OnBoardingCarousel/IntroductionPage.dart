// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key, required this.title});

  final String title;

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
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
