// ignore_for_file: prefer_const_constructors

import 'package:alamaapp/models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int _radioValue = 0; // Manage the state of the radio button

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value ?? 0;
    });
  }

  List<PaymentMethodsModel> displayPaymentMethods =
      List.from(PaymentMethodModelData.displayPaymentMethods);

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
                  itemBuilder: (context, index) => Container(
                    width: 340,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFC18553), width: 1)),
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
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Radio(
                            activeColor: Color(0xFFC18553),
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                        ],
                      ),
                    ),
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
