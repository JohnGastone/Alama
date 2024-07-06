// ignore_for_file: prefer_const_constructors

import 'package:alamaapp/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int _radioValue = -1; // Manage the state of the radio button

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value ?? -1;
    });
  }

  List<PaymentMethodsModel> displayPaymentMethods =
      List.from(PaymentMethodModelData.displayPaymentMethods);

  void _methodOfPaymentDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color(0xFF5E3023),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius:
                                30, // Adjust the radius to fit inside the border
                            backgroundColor: Colors.white,
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
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Estimated 8:30 - 9:15 PM',
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
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
                          CupertinoModalPopupRoute(
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFFC18553),
                child: IconButton(
                  icon: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Payment Method",
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: displayPaymentMethods.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () => _handleRadioValueChange(index),
                        child: Container(
                          width: 340,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: _radioValue == index
                                      ? Color(0xFFC18553)
                                      : Color(0xFFC18553).withOpacity(0.1),
                                  width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  displayPaymentMethods[index].paymentImage!,
                                  width: 50,
                                  height: 60,
                                ),
                                Text(
                                  displayPaymentMethods[index].paymentMethod!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Radio<int>(
                                  activeColor: Color(0xFFC18553),
                                  focusColor: Colors.grey,
                                  value: index,
                                  groupValue: _radioValue,
                                  onChanged: _handleRadioValueChange,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
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
                          "Complete Payment",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      _methodOfPaymentDialog();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
