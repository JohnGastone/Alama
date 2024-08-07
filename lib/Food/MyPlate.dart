// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:alamaapp/Payment/PaymentMethod.dart';
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
  final TextEditingController _controller = TextEditingController();
  bool _isEmpty = true;
  Timer? _timer;
  int _start = 300;
  bool _isOrderIssue = false; // Flag for order issues

  @override
  void initState() {
    super.initState();
    startTimer();
    _controller.addListener(() {
      setState(() {
        _isEmpty = _controller.text.isEmpty;
      });
    });
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0 || _isOrderIssue) {
        // Check if timer should stop
        setState(() {
          _timer?.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void resetTimer() {
    setState(() {
      _start = 300;
      _isOrderIssue = false; // Reset the flag
      if (_timer != null && _timer!.isActive) {
        _timer!.cancel();
      }
      startTimer();
    });
  }

  void stopTimerDueToIssue() {
    // Manually stop if there is an issue
    setState(() {
      _isOrderIssue = true;
    });
  }

  String get timerText {
    if (_isOrderIssue || _start == 0) {
      return 'There is a problem with the order management, waiter will come to clarify further. \n Thank you for your patience';
    }
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

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

  void _showPrePaymentDialog() {
    final theme = Theme.of(context); // Get the current theme

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: theme.brightness == Brightness.light
                  ? Colors.white
                  : Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                child: Container(
                    width: 320,
                    height: 80,
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius:
                                30, // Adjust the radius to fit inside the border
                            child: ClipOval(
                              child: Image.asset(
                                "./assets/waiter.png",
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "John Juma",
                                style: GoogleFonts.poppins(
                                    fontSize: 20, color: Color(0xFFC18553)),
                              ),
                              Text("Waiter",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18, color: Colors.grey))
                            ],
                          ),
                          Spacer(),
                          CircleAvatar(
                            radius:
                                30, // Adjust the radius to fit inside the border
                            backgroundColor: Color(0xFFC18553),
                            child: ClipOval(
                                child: Icon(
                              Icons.message,
                              color: Colors.white,
                            )),
                          ),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cooking Time',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: theme.brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Estimated 5 minutes, your plate will be delivered.',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: theme.brightness == Brightness.light
                              ? Colors.black
                              : Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.content_paste,
                          color: Color(0xFFC18553),
                        ),
                        Text(
                          "--------------",
                          style: GoogleFonts.poppins(
                              color: Color(0xFFC18553), fontSize: 15),
                        ),
                        Icon(
                          Icons.rice_bowl,
                          color: Color(0xFFC18553),
                        ),
                        Text(
                          "--------------",
                          style: GoogleFonts.poppins(
                              color: Color(0xFFC18553), fontSize: 15),
                        ),
                        Icon(
                          CupertinoIcons.check_mark_circled,
                          color: Color(0xFFC18553),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: InkWell(
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFC18553),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          "Continue To Payment",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => PaymentMethodPage()));
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme

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
                    height: 50,
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
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextField(
                                controller: _controller,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Color(0xFFC18553),
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    labelText:
                                        _isEmpty ? "Promo Code..." : null,
                                    labelStyle: GoogleFonts.poppins(
                                        fontSize: 18, color: Colors.grey)),
                              ),
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
                                        color:
                                            theme.brightness == Brightness.light
                                                ? Colors.black
                                                : Colors.white,
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
                padding: const EdgeInsets.only(left: 20, top: 20),
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
                                        color:
                                            theme.brightness == Brightness.light
                                                ? Colors.black
                                                : Colors.white,
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
                  padding: const EdgeInsets.only(
                      left: 10, top: 20, right: 10, bottom: 20),
                  child: Container(
                    height: 200,
                    width: 360,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order Summary",
                              style: GoogleFonts.poppins(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total items (2)",
                                    style: GoogleFonts.poppins(
                                        fontSize: 21, color: Colors.grey)),
                                Text(
                                  "Tsh 9,000",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Waiter/Waitress",
                                    style: GoogleFonts.poppins(
                                        fontSize: 21, color: Colors.grey)),
                                Text(
                                  "Nishai Kitwango",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Discount",
                                    style: GoogleFonts.poppins(
                                        fontSize: 21, color: Colors.grey)),
                                Text(
                                  "Tsh 500",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFC18553),
                                      fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Grand Total",
                                    style: GoogleFonts.poppins(
                                        fontSize: 21, color: Colors.grey)),
                                Text(
                                  "Tsh 8,500",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Text(
                    "Your plate will be delivered within",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: theme.brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Text(
                      timerText,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: theme.brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
              InkWell(
                child: Container(
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFC18553),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "Continue To Payment",
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  _showPrePaymentDialog();
                },
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
