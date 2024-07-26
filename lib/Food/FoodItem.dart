// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alamaapp/Food/MyPlate.dart';
import 'package:alamaapp/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodItemPage extends StatefulWidget {
  final FoodsModel? foodItem; // Add this to receive the foodItem data

  const FoodItemPage({super.key, this.foodItem}); // Modify the constructor

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
    final theme = Theme.of(context); // Get the current theme

    // Get the food data from widget.foodItem
    final foodName = widget.foodItem?.foodName ?? "Default Food Name";
    final foodPrice =
        widget.foodItem?.price?.toString() ?? "Tsh 0"; // Format the price
    final foodRating = widget.foodItem?.foodRating?.toString();
    final foodPreparationTime =
        widget.foodItem?.preparationTime?.toString() ?? "10 minutes";
    final foodImage = widget.foodItem?.foodImage ?? "./assets/default_food.png";
    final foodDescription =
        widget.foodItem?.foodDescription ?? "Default description";

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
                    foodName,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: theme.brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
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
                    foodPrice,
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
                      foodPreparationTime,
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(CupertinoIcons.star_fill, color: Color(0xFFC18553)),
                    SizedBox(width: 5),
                    Text(
                      "$foodRating",
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
                            color: theme.brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        foodDescription,
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
                        InkWell(
                          onTap: _plateDecrement,
                          child: Container(
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
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "$_counter",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: theme.brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: _plateIncrement,
                          child: Container(
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
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: Container(
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
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => MyPlatePage(),
                            ));
                      },
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
