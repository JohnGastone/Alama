// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPlatePage extends StatefulWidget {
  const MyPlatePage({super.key});

  @override
  State<MyPlatePage> createState() => _MyPlatePageState();
}

class _MyPlatePageState extends State<MyPlatePage> {
  int _counter = 1;

  void _plateIncrement() {
    setState((() {
      _counter++;
    }));
  }

  void _plateDecrement() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "My Plate",
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.w500),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Table Number",
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          "T-08",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Color(0xFFC18553), width: 1)),
                      child: Center(
                        child: Text(
                          "Change Table",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Color(0xFFC18553)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                child: Container(
                    width: 320,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(color: Color(0xFFC18553), width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.crop,
                            color: Color(0xFFC18553),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 120,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Promo Code...",
                                  labelStyle: GoogleFonts.poppins(
                                      fontSize: 18, color: Colors.grey)),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFC18553),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Apply",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "./assets/chipskavu.png",
                              )),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chips Kavu",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Tsh 7500",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFC18553)),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: _plateDecrement,
                                    child: Container(
                                      width:
                                          30, // Set the width to the diameter of the CircleAvatar
                                      height:
                                          30, // Set the height to the diameter of the CircleAvatar
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors
                                              .grey, // Set the border color
                                          width: 1.0, // Set the border width
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius:
                                            28, // Adjust the radius to fit inside the border
                                        backgroundColor: Colors.white,
                                        child: ClipOval(
                                          child: Icon(
                                            CupertinoIcons.minus,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "$_counter",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  InkWell(
                                    onTap: _plateIncrement,
                                    child: Container(
                                      width:
                                          30, // Set the width to the diameter of the CircleAvatar
                                      height:
                                          30, // Set the height to the diameter of the CircleAvatar
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors
                                              .grey, // Set the border color
                                          width: 1.0, // Set the border width
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius:
                                            28, // Adjust the radius to fit inside the border
                                        backgroundColor: Colors.white,
                                        child: ClipOval(
                                          child: Icon(
                                            CupertinoIcons.add,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Icon(
                                CupertinoIcons.delete,
                                color: Color(0xFFC18553),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "./assets/coke.png",
                              )),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cocacola",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Tsh 1500",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFC18553)),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: _plateDecrement,
                                    child: Container(
                                      width:
                                          30, // Set the width to the diameter of the CircleAvatar
                                      height:
                                          30, // Set the height to the diameter of the CircleAvatar
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors
                                              .grey, // Set the border color
                                          width: 1.0, // Set the border width
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius:
                                            28, // Adjust the radius to fit inside the border
                                        backgroundColor: Colors.white,
                                        child: ClipOval(
                                          child: Icon(
                                            CupertinoIcons.minus,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "$_counter",
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  InkWell(
                                    onTap: _plateIncrement,
                                    child: Container(
                                      width:
                                          30, // Set the width to the diameter of the CircleAvatar
                                      height:
                                          30, // Set the height to the diameter of the CircleAvatar
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors
                                              .grey, // Set the border color
                                          width: 1.0, // Set the border width
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius:
                                            28, // Adjust the radius to fit inside the border
                                        backgroundColor: Colors.white,
                                        child: ClipOval(
                                          child: Icon(
                                            CupertinoIcons.add,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Icon(
                                CupertinoIcons.delete,
                                color: Color(0xFFC18553),
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
