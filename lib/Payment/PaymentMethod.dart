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
  String? _selectedValue; // To hold the selected value from the dropdown

  // List of dropdown menu items
  final List<DropdownMenuItem<String>> dropdownMenuEntries = [
    DropdownMenuItem(
      value: 'M-Pesa',
      child: Text(
        'M-Pesa',
        style: GoogleFonts.poppins(
            decoration: TextDecoration.none, color: Colors.grey, fontSize: 17),
      ),
    ),
    DropdownMenuItem(
      value: 'TigoPesa',
      child: Text(
        'TigoPesa',
        style: GoogleFonts.poppins(
            decoration: TextDecoration.none, color: Colors.grey, fontSize: 17),
      ),
    ),
    DropdownMenuItem(
      value: 'Airtel Money',
      child: Text(
        'Airtel Money',
        style: GoogleFonts.poppins(
            decoration: TextDecoration.none, color: Colors.grey, fontSize: 17),
      ),
    ),
    DropdownMenuItem(
      value: 'Halopesa',
      child: Text(
        'Halopesa',
        style: GoogleFonts.poppins(
            decoration: TextDecoration.none, color: Colors.grey, fontSize: 17),
      ),
    ),
  ];

  void _methodOfPaymentDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.maxFinite,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pay By",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 60,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text(
                        'Select an option',
                        style: GoogleFonts.poppins(
                            decoration: TextDecoration.none,
                            color: Colors.grey,
                            fontSize: 17),
                      ),
                      value: _selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                      },
                      items: dropdownMenuEntries,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Number",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 60,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.grey)),
                child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style:
                          GoogleFonts.poppins(fontSize: 17, color: Colors.grey),
                      decoration:
                          InputDecoration(enabledBorder: InputBorder.none),
                    )),
              ),
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
