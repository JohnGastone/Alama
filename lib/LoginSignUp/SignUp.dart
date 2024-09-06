// ignore_for_file: prefer_const_constructors, prefer_final_fields, use_build_context_synchronously

import 'dart:io';

import 'package:alamaapp/LoginSignUp/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isChecked = false;
  bool _obscureText = false;
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _phoneNumber = '';
  String _password = '';
  String _confirmPassword = '';

  void _handleCheckboxChange(bool? newValue) {
    setState(() {
      _isChecked = newValue!;
    });
  }

  // Modified _signUp function
  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_password != _confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      // Prepare the request data
      final Map<String, String> signupData = {
        'email': _email,
        'phoneNumber': _phoneNumber,
        'password': _password,
      };

      final response = await http.post(
        Uri.parse('http://localhost:3000/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(signupData),
      );

      print('Request body: $signupData'); // Add this line
      print('Response body: ${response.body}'); // Add this line

      if (!await InternetAddress.lookup('google.com').first.hasAddress) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please check your internet connection.')),
        );
        return;
      }
      // Send the request to the backend API
      try {
        final response = await http.post(
          Uri.parse(
              'http://localhost:55522 /signup'), // Change to your backend URL
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(signupData),
        );

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sign-up successful!')),
          );
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (context) => LoginPage()),
          );
        } else if (response.statusCode == 400) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(jsonDecode(response.body)['message'])),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sign-up failed. Please try again.')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Use Form key
            child: Column(
              children: [
                SizedBox(height: 20),
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
                  padding: const EdgeInsets.only(right: 165),
                  child: Text("Email address",
                      style: GoogleFonts.poppins(fontSize: 20)),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value!,
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
                SizedBox(height: 5),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    style: GoogleFonts.poppins(),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onSaved: (value) => _phoneNumber = value!,
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
                Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: Text("Password",
                      style: GoogleFonts.poppins(fontSize: 20)),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "***************",
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye),
                        onPressed: () {
                          setState(() {
                            _obscureText =
                                !_obscureText; // Toggle visibility on tap
                          });
                        },
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
                  padding: const EdgeInsets.only(right: 125),
                  child: Text("Confirm Password",
                      style: GoogleFonts.poppins(fontSize: 20)),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                    onSaved: (value) => _confirmPassword = value!,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "***************",
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye),
                        onPressed: () {
                          setState(() {
                            _obscureText =
                                !_obscureText; // Toggle visibility on tap
                          });
                        },
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
                    onTap: _signUp,
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
                    ), // Call the _signUp function
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Or Sign Up with",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: theme.brightness == Brightness.light
                        ? Colors.black
                        : Colors.brown,
                  ),
                ),
                SizedBox(height: 10),
                // The rest of your UI code for social media login buttons, etc.
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on Future<List<InternetAddress>> {
  get first => null;
}
