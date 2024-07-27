// ignore_for_file: prefer_const_constructors

import 'package:alamaapp/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  int _radioValue = -1; // Manage the state of the radio button
  List<FocusNode> _focusNodes = [];
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(4, (index) => FocusNode());
    _controllers = List.generate(4, (index) => TextEditingController());
  }

  void _onTextChanged(int index, String value) {
    if (value.isNotEmpty && index < _focusNodes.length - 1) {
      _focusNodes[index].unfocus();
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (index == _focusNodes.length - 1 && value.isNotEmpty) {
      _focusNodes[index].unfocus();
    }
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

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

  void _mobilePaymentDialog() {
    final theme = Theme.of(context); // Get the current theme

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.maxFinite,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: theme.brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pay By",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
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
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      keyboardType: TextInputType.number,
                      style:
                          GoogleFonts.poppins(fontSize: 17, color: Colors.grey),
                      decoration: InputDecoration(
                          hintText: "0624839009",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 17, color: Colors.grey),
                          suffixIcon: Icon(CupertinoIcons.checkmark_seal),
                          suffixIconColor: Color(0xFFC18553),
                          enabledBorder: InputBorder.none),
                    )),
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
                          "Pay Now",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(
                                child: Text(
                                  "Enter Pin  ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: theme.brightness == Brightness.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                              content: SizedBox(
                                height: 200,
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        "Enter your M-Pesa Pin to continue",
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey, fontSize: 17),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: List.generate(4, (index) {
                                          return SizedBox(
                                            width: 40,
                                            child: TextField(
                                              controller: _controllers[index],
                                              focusNode: _focusNodes[index],
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    1),
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                              ],
                                              onChanged: (value) =>
                                                  _onTextChanged(index, value),
                                              decoration: InputDecoration(
                                                labelStyle: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide(
                                                      color: Colors.brown),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    // Loader here
                                    Text(
                                      "Please wait...",
                                      style: GoogleFonts.poppins(
                                          color: Colors.grey, fontSize: 17),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
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

  void _cardPaymentDialog() {
    final theme = Theme.of(context); // Get the current theme

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: double.maxFinite,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: theme.brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Image.asset(
                      "./assets/card.png",
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Pay via VISA or MASTERCARD ",
                        style: GoogleFonts.spaceMono(fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        child: Image.asset(
                          "./assets/crdb.png",
                          height: 65,
                          width: 65,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "Pay via CRDB Bank",
                                    style: GoogleFonts.spaceMono(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(
                                              13), // Limits input to 13 characters
                                          FilteringTextInputFormatter
                                              .digitsOnly, // Allows only digits
                                        ],
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Account Number"),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.datetime,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(10)
                                        ],
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText:
                                                "Account expiration date"),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(3)
                                        ],
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Account's CVV "),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: FloatingActionButton(
                                            backgroundColor: Colors.green,
                                            child: Text("Pay",
                                                style: GoogleFonts.spaceMono(
                                                    fontSize: 16)),
                                            onPressed: () {
                                              // Integration to CRDB payment API
                                            }),
                                      )
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Center(
                                          child: Text(
                                            "Cancel",
                                            style: GoogleFonts.spaceMono(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        )),
                                  ],
                                );
                              });
                        }),
                    InkWell(
                        child: Image.asset(
                          "./assets/nmb.png",
                          height: 65,
                          width: 65,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "Pay via NMB Bank",
                                    style: GoogleFonts.spaceMono(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Account Number"),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText:
                                                "Account expiration date"),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Account's CVV "),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: FloatingActionButton(
                                            backgroundColor: Colors.green,
                                            child: Text("Pay",
                                                style: GoogleFonts.spaceMono(
                                                    fontSize: 16)),
                                            onPressed: () {
                                              // Integration to NMB payment API
                                            }),
                                      )
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Center(
                                          child: Text(
                                            "Cancel",
                                            style: GoogleFonts.spaceMono(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        )),
                                  ],
                                );
                              });
                        }),
                    InkWell(
                        child: Image.asset(
                          "./assets/nbc.png",
                          height: 65,
                          width: 65,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "Pay via NBC Bank",
                                    style: GoogleFonts.spaceMono(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Account Number"),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText:
                                                "Account expiration date"),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Account CVV "),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: FloatingActionButton(
                                            backgroundColor: Colors.green,
                                            child: Text("Pay",
                                                style: GoogleFonts.spaceMono(
                                                    fontSize: 16)),
                                            onPressed: () {
                                              // Integration to NBC payment API
                                            }),
                                      )
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Center(
                                          child: Text(
                                            "Cancel",
                                            style: GoogleFonts.spaceMono(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        )),
                                  ],
                                );
                              });
                        }),
                    InkWell(
                        child: Image.asset(
                          "./assets/sc.png",
                          height: 65,
                          width: 65,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "Pay via Standard Chartered Bank",
                                    style: GoogleFonts.spaceMono(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Account Number"),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText:
                                                "Account expiration date"),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Account CVV "),
                                        style: GoogleFonts.spaceMono(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: FloatingActionButton(
                                            backgroundColor: Colors.green,
                                            child: Text("Pay",
                                                style: GoogleFonts.spaceMono(
                                                    fontSize: 16)),
                                            onPressed: () {
                                              // Integration to google maps
                                            }),
                                      )
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Center(
                                          child: Text(
                                            "Cancel",
                                            style: GoogleFonts.spaceMono(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        )),
                                  ],
                                );
                              });
                        })
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      child: Image.asset(
                        "./assets/equity.png",
                        height: 65,
                        width: 65,
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Pay via Equity Bank",
                                  style: GoogleFonts.spaceMono(
                                      fontSize: 16, color: Colors.black),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Account Number"),
                                      style: GoogleFonts.spaceMono(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Account expiration date"),
                                      style: GoogleFonts.spaceMono(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Account's CVV "),
                                      style: GoogleFonts.spaceMono(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: FloatingActionButton(
                                          backgroundColor: Colors.green,
                                          child: Text("Pay",
                                              style: GoogleFonts.spaceMono(
                                                  fontSize: 16)),
                                          onPressed: () {
                                            // Integration to CRDB payment API
                                          }),
                                    )
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Center(
                                        child: Text(
                                          "Cancel",
                                          style: GoogleFonts.spaceMono(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                      )),
                                ],
                              );
                            });
                      }),
                ],
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
                      if (_radioValue == 0) {
                        // Assuming index 0 is for mobile payment
                        _mobilePaymentDialog();
                      } else if (_radioValue == 1) {
                        // Assuming index 1 is for card payment
                        _cardPaymentDialog();
                      } else {
                        // Handle case where no radio button is selected
                        // (e.g., show an error message)
                      }
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
