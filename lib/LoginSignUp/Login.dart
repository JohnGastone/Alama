// ignore_for_file: prefer_const_constructors

import "package:alamaapp/Home/HomePage.dart";
import "package:alamaapp/LoginSignUp/ForgotPassword.dart";
import "package:alamaapp/LoginSignUp/SignUp.dart";
import "package:alamaapp/OnBoardingCarousel/IntroductionPage.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Login to your Account",
                style: GoogleFonts.poppins(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please signin to your account",
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(
                height: 40,
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
                padding: const EdgeInsets.only(left: 120),
                child: TextButton(
                  child: Text(
                    "Forgot Password?",
                    style:
                        GoogleFonts.poppins(fontSize: 18, color: Colors.brown),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
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
                        "Sign In",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Or Sign In with",
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.brown),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 60, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                            child: InkWell(
                          child: Image.asset(
                            "./assets/google.png",
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => IntroductionPage()));
                          },
                        ))),
                    CircleAvatar(
                        radius: 30,
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
                                    builder: (context) => IntroductionPage()));
                          },
                        ))),
                    CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                            child: InkWell(
                          child: Image.asset(
                            "./assets/apple-logo.png",
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => IntroductionPage()));
                          },
                        ))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 30),
                child: Row(
                  children: [
                    Text(
                      "Do'nt have an account?",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      child: Text("Register",
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.brown)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => SignUpPage()));
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
