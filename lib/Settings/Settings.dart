// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alamaapp/LoginSignUp/ChangePassword.dart';
import 'package:alamaapp/LoginSignUp/ForgotPassword.dart';
import 'package:alamaapp/LoginSignUp/Login.dart';
import 'package:alamaapp/Profile/Profile.dart';
import 'package:alamaapp/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = false;
  bool languageSwitchEnabled = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode:
          themeProvider.themeMode, // Get the theme mode from the provider
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Settings",
                  style: GoogleFonts.poppins(
                      fontSize: 30, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Text(
                      themeProvider.themeMode == ThemeMode.dark
                          ? "Dark Mode"
                          : "Light Mode",
                      style:
                          GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(width: 12),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Switch(
                        value: themeProvider.themeMode ==
                            ThemeMode
                                .dark, // Get the theme mode from the provider
                        activeColor: Color(0xFFC18553),
                        onChanged: (bool value) {
                          themeProvider
                              .toggleTheme(); // Toggle theme in the provider
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Information",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.person),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Profile",
                              style: GoogleFonts.poppins(fontSize: 17),
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => Userprofile()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.language),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Language",
                              style: GoogleFonts.poppins(fontSize: 17),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              languageSwitchEnabled ? "English" : "Kiswahili",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: Colors.grey),
                            ),
                            Switch(
                              value: languageSwitchEnabled,
                              activeColor: Color(0xFFC18553), // Custom color
                              onChanged: (bool value) {
                                setState(() {
                                  languageSwitchEnabled = value;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.bell),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Notification",
                              style: GoogleFonts.poppins(fontSize: 17),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              notificationsEnabled ? "On" : "Off",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: Colors.grey),
                            ),
                            Switch(
                              value: notificationsEnabled,
                              activeColor: Color(0xFFC18553), // Custom color
                              onChanged: (bool value) {
                                setState(() {
                                  notificationsEnabled = value;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Security",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.lock),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Change Password",
                              style: GoogleFonts.poppins(fontSize: 17),
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        ChangePasswordPage()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.lock_open),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Forgot Password",
                              style: GoogleFonts.poppins(fontSize: 17),
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Help & Support",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.lock_shield),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Legal and Policies",
                              style: GoogleFonts.poppins(fontSize: 17),
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.help_outline_sharp),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Help and Support",
                              style: GoogleFonts.poppins(fontSize: 17),
                            )
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 330,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xFFC18553), width: 1)),
                    child: Center(
                      child: Text(
                        "Log Out",
                        style: GoogleFonts.poppins(
                            color: Color(0xFFC18553),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
