// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({super.key});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor:
          theme.brightness == Brightness.light ? Colors.white : Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:
            theme.brightness == Brightness.light ? Colors.white : Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(right: 110),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: CircleAvatar(
                  backgroundColor: Colors.brown,
                  child: Icon(
                    CupertinoIcons.back,
                    color: theme.brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Profile",
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: theme.brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                height: 610,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(170),
                        topLeft: Radius.circular(170))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 60,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            image: DecorationImage(
                                image: AssetImage(
                                  "./assets/waiter.png",
                                ),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: CircleAvatar(
                                backgroundColor: Colors.white24,
                                child: Icon(
                                  CupertinoIcons.pen,
                                  color: Color.fromARGB(255, 28, 39, 81),
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Kathleen Lugendo",
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "kathleenlugendo@cyber.com",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 219, 158, 178),
                                child: Icon(CupertinoIcons.person),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "User Details",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                          ),
                          Icon(CupertinoIcons.forward, color: Colors.white)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 169, 158, 219),
                                child: Icon(CupertinoIcons.book),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Certificate",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                          ),
                          Icon(CupertinoIcons.forward, color: Colors.white)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 233, 232, 163),
                                child: Icon(Icons.account_balance_wallet),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Payment",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                          ),
                          Icon(CupertinoIcons.forward, color: Colors.white)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 185, 130, 190),
                                child: Icon(CupertinoIcons.doc),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Document",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                          ),
                          Icon(CupertinoIcons.forward, color: Colors.white)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(255, 158, 192, 219),
                                child: Icon(Icons.logout),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Logout",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
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
