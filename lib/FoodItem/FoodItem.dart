// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodItemPage extends StatefulWidget {
  const FoodItemPage({super.key});

  @override
  State<FoodItemPage> createState() => _FoodItemPageState();
}

class _FoodItemPageState extends State<FoodItemPage> {
  final List<String> images = [
    "./assets/chipskavu.png",
    "./assets/walinyama.png",
    "./assets/walikuku.png"
  ];
  final PageController _pageController =
      PageController(viewportFraction: 0.8, keepPage: true);

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
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Food Item",
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.w500),
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                height: 250,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, right: 20),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  CupertinoIcons.heart_fill,
                                  color: Color(0xFFC18553),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 160,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SmoothPageIndicator(
                                controller: _pageController,
                                count: images.length,
                                effect: ExpandingDotsEffect(
                                  dotColor: Colors.white,
                                  activeDotColor: Color(0xFFC18553),
                                  dotHeight: 15,
                                  dotWidth: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Chipsi Kavu",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromARGB(255, 54, 52, 50),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tsh 7500",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFFC18553),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.clock, color: Color(0xFFC18553)),
                    SizedBox(width: 5),
                    Text(
                      "15 minutes",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(CupertinoIcons.star_fill, color: Color(0xFFC18553)),
                    SizedBox(width: 5),
                    Text(
                      "4.9",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Divider(
                  height: 2,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 200),
                        child: Text(
                          "Description",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromARGB(255, 39, 36, 34),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet consectetur. Mattis id malesuada facilisis nibh neque eget morbi quis. Est vitae id consectetur quam fringilla. Interdum.",
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Side dishes",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text("See All",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Color(0xFFC18553),
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width:
                              40, // Set the width to the diameter of the CircleAvatar
                          height:
                              40, // Set the height to the diameter of the CircleAvatar
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey, // Set the border color
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
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "4",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width:
                              40, // Set the width to the diameter of the CircleAvatar
                          height:
                              40, // Set the height to the diameter of the CircleAvatar
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey, // Set the border color
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
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xFFC18553)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              CupertinoIcons.shopping_cart,
                              color: Colors.white,
                            ),
                            Text(
                              "Add to my plate",
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
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
