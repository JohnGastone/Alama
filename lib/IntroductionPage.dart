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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Alama App', style: GoogleFonts.poppins(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
