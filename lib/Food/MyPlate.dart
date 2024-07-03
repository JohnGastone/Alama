// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPlatePage extends StatefulWidget {
  const MyPlatePage({super.key});

  @override
  State<MyPlatePage> createState() => _MyPlatePageState();
}

class _MyPlatePageState extends State<MyPlatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Food items added to cart will appear here in plate",
                style: GoogleFonts.poppins(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
