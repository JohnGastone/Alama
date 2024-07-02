// ignore_for_file: prefer_const_constructors

import 'package:alamaapp/LoginSignUp/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../OnBoardingCarousel/SplashScreen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isChecked = false;

  void _handleCheckboxChange(bool? newValue) {
    setState(() {
      _isChecked = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Center(
                  child: Text(
                    "Create new Account and grab a plate!!",
                    style: GoogleFonts.poppins(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Please fill in your information below to start browsing our menu.",
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Text("Email address",
                    style: GoogleFonts.poppins(fontSize: 20)),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "alamaclient@yahoo.com",
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 140),
                child: Text("Phone Number",
                    style: GoogleFonts.poppins(fontSize: 20)),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "+255 624 839 009",
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 190),
                child:
                    Text("Password", style: GoogleFonts.poppins(fontSize: 20)),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "***************",
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                    suffixIcon: Icon(CupertinoIcons.eye),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.brown),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 10),
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: _handleCheckboxChange,
                      checkColor: Colors.brown,
                      fillColor: WidgetStateProperty.all(Colors.white),
                      side: BorderSide(color: Colors.brown, width: 1.0),
                    ),
                    Flexible(
                      child: Text(
                        "I agree with terms of service and privacy policy",
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.brown),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Or Sign Up with",
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 60, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width:
                          60, // Set the width to the diameter of the CircleAvatar
                      height:
                          60, // Set the height to the diameter of the CircleAvatar
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey, // Set the border color
                          width: 1.0, // Set the border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius:
                            28, // Adjust the radius to fit inside the border
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: InkWell(
                            child: Image.asset(
                              "./assets/google.png",
                              height: double.infinity,
                              width: double.infinity,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => Splashscreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width:
                          60, // Set the width to the diameter of the CircleAvatar
                      height:
                          60, // Set the height to the diameter of the CircleAvatar
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey, // Set the border color
                          width: 1.0, // Set the border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius:
                            28, // Adjust the radius to fit inside the border
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: InkWell(
                            child: Image.asset(
                              "./assets/facebook.png",
                              height: 40,
                              width: 40,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => Splashscreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width:
                          60, // Set the width to the diameter of the CircleAvatar
                      height:
                          60, // Set the height to the diameter of the CircleAvatar
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey, // Set the border color
                          width: 1.0, // Set the border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius:
                            28, // Adjust the radius to fit inside the border
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: InkWell(
                            child: Image.asset(
                              "./assets/apple-logo.png",
                              height: 40,
                              width: 40,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => Splashscreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 30),
                child: Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      child: Text("Sign In",
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.brown)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
