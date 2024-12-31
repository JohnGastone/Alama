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
  final TextEditingController _searchController = TextEditingController();

  int _selectedIndex = 0;

  void updateSearchAndFilter(int index) {
    setState(() {
      // Update the selected index
      _selectedIndex = index;

      // Determine if any category is selected (index > 0)
      bool isAnyCategorySelected = index > 0;

      // Get the current search query and convert to lowercase for case-insensitive matching
      String searchQuery = _searchController.text.toLowerCase();

      // Helper function to check if an item contains the search query
      bool containsSearchQuery(String? itemName) {
        return itemName != null && itemName.toLowerCase().contains(searchQuery);
      }

      // Filtering logic for different food categories
      displayFoods = (index == 0)
          ? List.from(FoodsModelData.displayFoods)
          : FoodsModelData.displayFoods
              .where((food) =>
                  // Match category, food name, or restaurant name
                  (isAnyCategorySelected &&
                      food.category?.toLowerCase() ==
                          _getCategoryName(index).toLowerCase()) &&
                  containsSearchQuery(food.foodName))
              .toList();

      // Similar filtering for Coffee
      displayCoffee = (index == 1)
          ? List.from(CoffeeModelData.displayCoffee)
          : CoffeeModelData.displayCoffee
              .where((coffee) =>
                  (isAnyCategorySelected &&
                      coffee.category?.toLowerCase() ==
                          _getCategoryName(index).toLowerCase()) &&
                  containsSearchQuery(coffee.coffeeName))
              .toList();

      // Filtering for Soft Drinks
      displaySoftDrinks = (index == 2)
          ? List.from(SoftDrinksModelData.displaySoftDrinks)
          : SoftDrinksModelData.displaySoftDrinks
              .where((softdrink) =>
                  (isAnyCategorySelected &&
                      softdrink.category?.toLowerCase() ==
                          _getCategoryName(index).toLowerCase()) &&
                  containsSearchQuery(softdrink.softDrinkName))
              .toList();

      // Filtering for Fruits
      displayFruits = (index == 3)
          ? List.from(FruitsModelData.displayFruits)
          : FruitsModelData.displayFruits
              .where((fruit) =>
                  (isAnyCategorySelected &&
                      fruit.category?.toLowerCase() ==
                          _getCategoryName(index).toLowerCase()) &&
                  containsSearchQuery(fruit.fruitName))
              .toList();

      // Filtering for Tea
      displayTea = (index == 4)
          ? List.from(TeaModelData.displayTea)
          : TeaModelData.displayTea
              .where((tea) =>
                  (isAnyCategorySelected &&
                      tea.category?.toLowerCase() ==
                          _getCategoryName(index).toLowerCase()) &&
                  containsSearchQuery(tea.teaName))
              .toList();

      // Filtering for Local Foods
      displayLocalFoods = (index == 5)
          ? List.from(LocalFoodsList.displayLocalFoods)
          : LocalFoodsList.displayLocalFoods
              .where((localfood) =>
                  (isAnyCategorySelected &&
                      localfood.category?.toLowerCase() ==
                          _getCategoryName(index).toLowerCase()) &&
                  containsSearchQuery(localfood.localFoodName))
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 230,
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
                          onTap: () => updateSearchAndFilter(index),
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
                                    _getCategoryName(index),
                                    style: GoogleFonts.poppins(
                                      fontSize: 17,
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
                        return buildItemCard(
                            context,
                            _selectedIndex == 0
                                ? displayFoods[index]
                                : _selectedIndex == 1
                                    ? displayCoffee[index]
                                    : _selectedIndex == 2
                                        ? displaySoftDrinks[index]
                                        : _selectedIndex == 3
                                            ? displayFruits[index]
                                            : _selectedIndex == 4
                                                ? displayTea[index]
                                                : displayLocalFoods[index],
                            _selectedIndex);
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
                width: double.maxFinite,
                height: 90,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 18, top: 18, left: 25, right: 25),
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
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.white)),
                                child: Center(
                                  child: Icon(
                                    CupertinoIcons.bell,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "What would you like to eat?",
                            style: GoogleFonts.poppins(
                                fontSize: 32, color: Colors.white),
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
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 180,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 330,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller:
                          _searchController, // Existing search controller
                      onChanged: (value) {
                        // Replace _toggleSelection with a more robust search and filter method
                        updateSearchAndFilter(_selectedIndex);
                      },
                      cursorColor: Colors.grey,
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.white),
                      decoration: InputDecoration(
                          // Existing prefix and suffix icons
                          prefixIcon: Icon(CupertinoIcons.search),
                          prefixIconColor: Colors.white,
                          suffixIcon: Icon(Icons.sort),
                          suffixIconColor: Colors.white,

                          // Existing hint text styling
                          hintText: "Search a Food or Restaurant",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white),

                          // Existing border settings
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    )),
              ),
            ),
          )
        ]),
      ),
    );
  }

  // Function to build each grid item
  Widget _buildGridItem(int index) {
    final isSelected = _selectedIndex == index; // Check if selected

    if (index >= 0 && index <= 5) {
      return Image.asset(
        _getCategoryPath(index), // Function to get the correct image path
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
  String _getCategoryPath(int index) {
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

  String _getCategoryName(int index) {
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
        return "Local Dishes";
      default:
        return "Addons";
    }
  }

  Widget buildItemCard(BuildContext context, dynamic item, int selectedIndex) {
    // Determine which properties to use based on the selected index and item type
    String imagePath, itemName, rating;

    String itemType;
    switch (selectedIndex) {
      case 0: // Foods
        imagePath = item.foodImage;
        itemName = item.foodName;
        rating = "${item.foodRating}";
        itemType = 'food';
        break;
      case 1: // Coffee
        imagePath = item.coffeeImage;
        itemName = item.coffeeName;
        rating = "${item.coffeeRating}";
        itemType = 'coffee';
        break;
      case 2: // Soft Drinks
        imagePath = item.softDrinkImage;
        itemName = item.softDrinkName;
        rating = "${item.softDrinkRating}";
        itemType = 'softDrink';
        break;
      case 3: // Fruits
        imagePath = item.fruitImage;
        itemName = item.fruitName;
        rating = "${item.fruitRating}";
        itemType = 'fruit';
        break;
      case 4: // Tea
        imagePath = item.teaImage;
        itemName = item.teaName;
        rating = "${item.teaRating}";
        itemType = 'tea';
        break;
      case 5: // Local Foods
        imagePath = item.localFoodImage;
        itemName = item.localFoodName;
        rating = "${item.localFoodRating}";
        itemType = 'localFood';
        break;
      default:
        return SizedBox.shrink(); // Return empty widget if no match
    }

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
            SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 4),
              child: Container(
                width: selectedIndex == 5
                    ? double.maxFinite
                    : 150, // Specific width for Local Foods
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 7, right: 7),
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 50),
              child: Text(
                itemName,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(CupertinoIcons.star_fill, color: Color(0xFFC18553)),
                  SizedBox(width: 5),
                  Text(
                    rating,
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.black),
                  ),
                  Spacer(),
                  Icon(CupertinoIcons.clock, color: Color(0xFFC18553)),
                  SizedBox(width: 5),
                  Text(
                    item.preparationTime,
                    style:
                        GoogleFonts.poppins(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tsh ${item.price}",
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
                builder: (context) =>
                    FoodItemPage(item: item, itemType: itemType)));
      },
    );
  }

// In your build method or ListView.builder
  Widget buildListItem(BuildContext context, int index) {
    switch (_selectedIndex) {
      case 0: // Foods
        return index < displayFoods.length
            ? buildItemCard(context, displayFoods[index], _selectedIndex)
            : SizedBox.shrink();
      case 1: // Coffee
        return index < displayCoffee.length
            ? buildItemCard(context, displayCoffee[index], _selectedIndex)
            : SizedBox.shrink();
      case 2: // Soft Drinks
        return index < displaySoftDrinks.length
            ? buildItemCard(context, displaySoftDrinks[index], _selectedIndex)
            : SizedBox.shrink();
      case 3: // Fruits
        return index < displayFruits.length
            ? buildItemCard(context, displayFruits[index], _selectedIndex)
            : SizedBox.shrink();
      case 4: // Tea
        return index < displayTea.length
            ? buildItemCard(context, displayTea[index], _selectedIndex)
            : SizedBox.shrink();
      case 5: // Local Foods
        return index < displayLocalFoods.length
            ? buildItemCard(context, displayLocalFoods[index], _selectedIndex)
            : SizedBox.shrink();
      default:
        return SizedBox.shrink();
    }
  }
}
