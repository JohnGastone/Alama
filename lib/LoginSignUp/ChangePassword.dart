// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import "package:alamaapp/LoginSignUp/Login.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool obscureTextCurrent = false;
  bool obscureTextNew = false;
  bool obscureTextConfirm = false;

  void _showResetDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "./assets/illustration.png",
                  width: 250,
                  height: 200,
                ),
              ),
              Center(
                child: Text(
                  'Password Changed',
                  style: GoogleFonts.poppins(
                      fontSize: 34, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Password successfully changed you can now Login using the new password',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Spacer(),
              Center(
                child: Padding(
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
                          "Sign In",
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => LoginPage()));
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
        automaticallyImplyLeading: true,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 70),
            child: Text(
              "Change Password",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Text(
                  "Change Password",
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
                  "Your new password must be different from the last one you created",
                  style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Text("Current Password",
                    style: GoogleFonts.poppins(fontSize: 20)),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  obscureText: obscureTextCurrent,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    counter: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Must be at least 8 characters",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                    counterStyle:
                        GoogleFonts.poppins(fontSize: 16, color: Colors.brown),
                    labelText: "***************",
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(obscureTextCurrent
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye),
                      onPressed: () {
                        setState(() {
                          obscureTextCurrent =
                              !obscureTextCurrent; // Toggle visibility on tap
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
              Padding(
                padding: const EdgeInsets.only(right: 170),
                child: Text("New Password",
                    style: GoogleFonts.poppins(fontSize: 20)),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  obscureText: obscureTextNew,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    counter: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Must be at least 8 characters",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                    counterStyle:
                        GoogleFonts.poppins(fontSize: 16, color: Colors.brown),
                    labelText: "***************",
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(obscureTextNew
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye),
                      onPressed: () {
                        setState(() {
                          obscureTextNew =
                              !obscureTextNew; // Toggle visibility on tap
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 105),
                child: Text("Confirm New Password",
                    style: GoogleFonts.poppins(fontSize: 20)),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  obscureText: obscureTextConfirm,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    counter: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Both passwords must match",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                    counterStyle:
                        GoogleFonts.poppins(fontSize: 16, color: Colors.brown),
                    labelText: "***************",
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(obscureTextConfirm
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye),
                      onPressed: () {
                        setState(() {
                          obscureTextConfirm =
                              !obscureTextConfirm; // Toggle visibility on tap
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
              SizedBox(
                height: 100,
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
                        "Change",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    _showResetDialog();
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
