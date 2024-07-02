// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variable to keep track of the selected container index
  int _selectedIndex = -1;

  void _toggleSelection(int index) {
    setState(() {
      if (_selectedIndex == index) {
        // If the selected container is tapped again, deselect it
        _selectedIndex = -1;
      } else {
        // Otherwise, select the new container
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                './assets/backtop.png',
                fit: BoxFit.cover,
              ),
              titlePadding:
                  EdgeInsets.only(left: 16, bottom: 16, right: 16, top: 95),
              title: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius:
                            20, // Adjust the radius to fit inside the border
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            "./assets/bartender.png",
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome back",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "Jovan",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.bell,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "What would you like to eat?",
                    style:
                        GoogleFonts.poppins(fontSize: 25, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Menu by Category",
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See All",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.brown),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(5, (index) {
                            return GestureDetector(
                              onTap: () => _toggleSelection(index),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 80,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: _selectedIndex == index
                                        ? Color(0xFFC18553)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 10),
                                      Icon(
                                        _getIcon(index),
                                        color: _selectedIndex == index
                                            ? Colors.white
                                            : Colors.grey,
                                        size: 30,
                                      ),
                                      Text(
                                        _getText(index),
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: _selectedIndex == index
                                              ? Colors.white
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.rice_bowl_sharp;
      case 1:
        return Icons.coffee_sharp;
      case 2:
        return Icons.rice_bowl;
      case 3:
        return Icons.apple;
      default:
        return Icons.error;
    }
  }

  String _getText(int index) {
    switch (index) {
      case 0:
        return "Food";
      case 1:
        return "Coffee";
      case 2:
        return "Drinks";
      case 3:
        return "Fruits";
      default:
        return "Addons";
    }
  }
}
