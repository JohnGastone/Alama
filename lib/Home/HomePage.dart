// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:alamaapp/Food/FoodItem.dart';
import 'package:alamaapp/Food/MyPlate.dart';
import 'package:alamaapp/Settings/Settings.dart';
import 'package:alamaapp/models.dart';
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
  int _selectedIndex = 0;

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

  List<FoodsModel> displayFoods = List.from(FoodsModelData.displayFoods);
  List<CoffeeModel> displayCoffee = List.from(CoffeeModelData.getCoffee);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
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
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8, right: 8),
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
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: displayFoods.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => InkWell(
                      child: Container(
                        height: 210,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 1,
                            ),
                            Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(
                                      displayFoods[index].foodImage!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 7, right: 7),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      CupertinoIcons.heart,
                                      color: Color(0xFFC18553),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 65),
                              child: Text(
                                displayFoods[index].foodName!,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(CupertinoIcons.star_fill,
                                      color: Color(0xFFC18553)),
                                  SizedBox(width: 5),
                                  Text(
                                    "${displayFoods[index].foodRating!}",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  Spacer(),
                                  Icon(CupertinoIcons.clock,
                                      color: Color(0xFFC18553)),
                                  SizedBox(width: 5),
                                  Text(
                                    displayFoods[index].preparationTime!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${displayFoods[index].price!}",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color(0xFFC18553),
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => FoodItemPage()));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 0,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 360,
                height: 90,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Icon(
                            CupertinoIcons.home,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                        ),
                        InkWell(
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                        ),
                        InkWell(
                            child: Icon(
                              CupertinoIcons.bag,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => MyPlatePage()));
                            }),
                        InkWell(
                          child: Icon(CupertinoIcons.settings_solid,
                              color: Colors.grey),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => SettingsPage()));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 200.0,
                child: Stack(
                  children: [
                    Image.asset(
                      './assets/backtop.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      top: 45,
                      child: Column(
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
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    "Jovan",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
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
                            style: GoogleFonts.poppins(
                                fontSize: 35, color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
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
      case 4:
        return Icons.rice_bowl;
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
