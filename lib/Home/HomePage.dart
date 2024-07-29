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
      _selectedIndex = index;

      displayFoods = (index == 0)
          ? List.from(FoodsModelData.displayFoods)
          : FoodsModelData.displayFoods
              .where((food) =>
                  food.category?.toLowerCase() ==
                  _getText(index).toLowerCase()) // Case-insensitive match
              .toList();

      displayCoffee = (index == 1)
          ? List.from(CoffeeModelData.displayCoffee)
          : CoffeeModelData.displayCoffee
              .where((coffee) =>
                  coffee.category?.toLowerCase() ==
                  _getText(index).toLowerCase()) // Case-insensitive match
              .toList();

      displaySoftDrinks = (index == 2)
          ? List.from(SoftDrinksModelData.displaySoftDrinks)
          : SoftDrinksModelData.displaySoftDrinks
              .where((softdrink) =>
                  softdrink.category?.toLowerCase() ==
                  _getText(index).toLowerCase()) // Case-insensitive match
              .toList();

      displayFruits = (index == 3)
          ? List.from(FruitsModelData.displayFruits)
          : FruitsModelData.displayFruits
              .where((fruit) =>
                  fruit.category?.toLowerCase() ==
                  _getText(index).toLowerCase()) // Case-insensitive match
              .toList();

      displayTea = (index == 4)
          ? List.from(TeaModelData.displayTea)
          : TeaModelData.displayTea
              .where((tea) =>
                  tea.category?.toLowerCase() ==
                  _getText(index).toLowerCase()) // Case-insensitive match
              .toList();

      displayLocalFoods = (index == 5)
          ? List.from(LocalFoodsList.displayLocalFoods)
          : LocalFoodsList.displayLocalFoods
              .where((localfoods) =>
                  localfoods.category?.toLowerCase() ==
                  _getText(index).toLowerCase()) // Case-insensitive match
              .toList();
    });
  }

  List<FoodsModel> displayFoods = List.from(FoodsModelData.displayFoods);
  List<CoffeeModel> displayCoffee = List.from(CoffeeModelData.displayCoffee);
  List<SoftDrinksModel> displaySoftDrinks =
      List.from(SoftDrinksModelData.displaySoftDrinks);
  List<FruitsModel> displayFruits = List.from(FruitsModelData.displayFruits);
  List<TeaModel> displayTea = List.from(TeaModelData.displayTea);
  List<LocalFoodsModel> displayLocalFoods =
      List.from(LocalFoodsList.displayLocalFoods);

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
                      children: List.generate(7, (index) {
                        return GestureDetector(
                          onTap: () => _toggleSelection(index),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8, right: 8),
                            child: Container(
                              height: 80,
                              width: 100,
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
                                  _buildGridItem(index),
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
                      itemCount: _selectedIndex == 0
                          ? displayFoods.length
                          : (_selectedIndex == 1
                              ? displayCoffee.length
                              : (_selectedIndex == 2
                                  ? displaySoftDrinks.length
                                  : (_selectedIndex == 3
                                      ? displayFruits.length
                                      : (_selectedIndex == 4
                                          ? displayTea.length
                                          : displayLocalFoods.length)))),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 40,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        if (_selectedIndex == 0 &&
                            index < displayFoods.length) {
                          // Check if the selected index is 0 (Foods) and if the index is valid for the displayFoods list
                          return InkWell(
                            child: Container(
                              height: 210,
                              width: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 4),
                                    child: Container(
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
                                        padding: const EdgeInsets.only(
                                            top: 7, right: 7),
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
                                  ),
                                  Text(
                                    displayFoods[index].foodName!,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
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
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        Icon(CupertinoIcons.clock,
                                            color: Color(0xFFC18553)),
                                        SizedBox(width: 5),
                                        Text(
                                          displayFoods[index].preparationTime!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black),
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
                                      builder: (context) => FoodItemPage(
                                          foodItem: _selectedIndex == 0
                                              ? displayFoods[index]
                                              : null)));
                            },
                          );
                        } else if (_selectedIndex == 1 &&
                            index < displayCoffee.length) {
                          // Check if the selected index is 1 (Coffee) and if the index is valid for the displayCoffee list
                          return InkWell(
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
                                            displayCoffee[index].coffeeImage!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7, right: 7),
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
                                    padding: const EdgeInsets.only(right: 50),
                                    child: Text(
                                      displayCoffee[index].coffeeName!,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(CupertinoIcons.star_fill,
                                            color: Color(0xFFC18553)),
                                        SizedBox(width: 5),
                                        Text(
                                          "${displayCoffee[index].coffeeRating!}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        Icon(CupertinoIcons.clock,
                                            color: Color(0xFFC18553)),
                                        SizedBox(width: 5),
                                        Text(
                                          displayCoffee[index].preparationTime!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${displayCoffee[index].price!}",
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
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       CupertinoPageRoute(
                            //           builder: (context) => FoodItemPage()));
                            // },
                          );
                        } else if (_selectedIndex == 2 &&
                            index < displaySoftDrinks.length) {
                          // Check if the selected index is 1 (SoftDrinks) and if the index is valid for the displaySoftDrinks list
                          return InkWell(
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
                                            displaySoftDrinks[index]
                                                .softDrinkImage!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7, right: 7),
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
                                    padding: const EdgeInsets.only(right: 50),
                                    child: Text(
                                      displaySoftDrinks[index].softDrinkName!,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(CupertinoIcons.star_fill,
                                            color: Color(0xFFC18553)),
                                        SizedBox(width: 5),
                                        Text(
                                          "${displaySoftDrinks[index].softDrinkRating!}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        Icon(CupertinoIcons.clock,
                                            color: Color(0xFFC18553)),
                                        SizedBox(width: 5),
                                        Text(
                                          displaySoftDrinks[index]
                                              .preparationTime!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${displaySoftDrinks[index].price!}",
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
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       CupertinoPageRoute(
                            //           builder: (context) => FoodItemPage()));
                            // },
                          );
                        } else if (_selectedIndex == 3 &&
                            index < displayFruits.length) {
                          // Check if the selected index is 1 (SoftDrinks) and if the index is valid for the displaySoftDrinks list
                          return InkWell(
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
                                            displayFruits[index].fruitImage!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7, right: 7),
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
                                    padding: const EdgeInsets.only(right: 50),
                                    child: Text(
                                      displayFruits[index].fruitName!,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(CupertinoIcons.star_fill,
                                            color: Color(0xFFC18553)),
                                        SizedBox(width: 5),
                                        Text(
                                          "${displayFruits[index].fruitRating!}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        Icon(CupertinoIcons.clock,
                                            color: Color(0xFFC18553)),
                                        SizedBox(width: 5),
                                        Text(
                                          displayFruits[index].preparationTime!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${displayFruits[index].price!}",
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
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       CupertinoPageRoute(
                            //           builder: (context) => FoodItemPage()));
                            // },
                          );
                        } else if (_selectedIndex == 4 &&
                            index < displayTea.length) {
                          // Check if the selected index is 1 (SoftDrinks) and if the index is valid for the displaySoftDrinks list
                          return InkWell(
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
                                            displayTea[index].teaImage!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7, right: 7),
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
                                    padding: const EdgeInsets.only(right: 50),
                                    child: Text(
                                      displayTea[index].teaName!,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(CupertinoIcons.star_fill,
                                            color: Color(0xFFC18553)),
                                        SizedBox(width: 5),
                                        Text(
                                          "${displayTea[index].teaRating!}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        Icon(CupertinoIcons.clock,
                                            color: Color(0xFFC18553)),
                                        SizedBox(width: 5),
                                        Text(
                                          displayTea[index].preparationTime!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${displayTea[index].price!}",
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
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       CupertinoPageRoute(
                            //           builder: (context) => FoodItemPage()));
                            // },
                          );
                        } else if (_selectedIndex == 5 &&
                            index < displayLocalFoods.length) {
                          // Check if the selected index is 1 (SoftDrinks) and if the index is valid for the displaySoftDrinks list
                          return InkWell(
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
                                            displayLocalFoods[index]
                                                .localFoodImage!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7, right: 7),
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
                                    padding: const EdgeInsets.only(right: 50),
                                    child: Text(
                                      displayLocalFoods[index].localFoodName!,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(CupertinoIcons.star_fill,
                                            color: Color(0xFFC18553)),
                                        SizedBox(width: 5),
                                        Text(
                                          "${displayLocalFoods[index].localFoodRating!}",
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        Icon(CupertinoIcons.clock,
                                            color: Color(0xFFC18553)),
                                        SizedBox(width: 5),
                                        Text(
                                          displayLocalFoods[index]
                                              .preparationTime!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${displayLocalFoods[index].price!}",
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
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       CupertinoPageRoute(
                            //           builder: (context) => FoodItemPage()));
                            // },
                          );
                        } else {
                          // Handle cases where the index is out of range or the selected list is empty.
                          // You can return an empty container or a placeholder widget.
                          return Container();
                        }
                      }),
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
                          child: Column(
                            children: [
                              Image.asset(
                                "./assets/home.png",
                                height: 28,
                                width: 28,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Home",
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: Color(0xFFC18553)),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                        ),
                        InkWell(
                          child: Column(
                            children: [
                              Image.asset(
                                "./assets/explore.png",
                                height: 35,
                                width: 35,
                                color: Colors.grey,
                              ),
                              Text(
                                "Explore Foods",
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: Color(0xFFC18553)),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                        ),
                        InkWell(
                            child: Column(
                              children: [
                                Image.asset(
                                  "./assets/myplate.png",
                                  height: 28,
                                  width: 28,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "My Plate",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15, color: Color(0xFFC18553)),
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => MyPlatePage()));
                            }),
                        InkWell(
                          child: Column(
                            children: [
                              Image.asset(
                                "./assets/settings.png",
                                height: 28,
                                width: 28,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Settings",
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: Color(0xFFC18553)),
                              )
                            ],
                          ),
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

  // Function to build each grid item
  Widget _buildGridItem(int index) {
    final isSelected = _selectedIndex == index; // Check if selected

    if (index >= 0 && index <= 5) {
      return Image.asset(
        _getImagePath(index), // Function to get the correct image path
        width: 30,
        height: 30,
        fit: BoxFit.cover,
        color: isSelected ? Colors.white : null,
      );
    } else {
      return Icon(
        Icons.error,
        size: 30,
        color: isSelected ? Colors.white : Colors.grey,
      );
    }
  }

  // Helper function to get the image path based on index
  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return "./assets/restaurant.png";
      case 1:
        return "./assets/coffee-cup.png";
      case 2:
        return "./assets/softdrinks.png";
      case 3:
        return "./assets/fruit.png";
      case 4:
        return "./assets/tea.png";
      case 5:
        return "./assets/salad.png";
      default:
        return "./assets/error.png"; // Or provide a default error image path
    }
  }

  String _getText(int index) {
    switch (index) {
      case 0:
        return "Food";
      case 1:
        return "Coffee";
      case 2:
        return "Soft Drinks";
      case 3:
        return "Fruits";
      case 4:
        return "Tea";
      case 5:
        return "Locals";
      default:
        return "Addons";
    }
  }
}
