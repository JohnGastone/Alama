// ignore_for_file: prefer_const_constructors
import "package:alamaapp/LoginSignUp/CodeVerification.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.poppins(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Text(
                  "Enter your email address and we will send you confirmation code to change your password",
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey),
                ),
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
                height: 13,
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
              Padding(
                padding: EdgeInsets.all(25),
                child: InkWell(
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => CodeVerificationPage()),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 250,
              )
            ],
          ),
        ),
      ),
    );
  }
}
