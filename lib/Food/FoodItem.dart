// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:alamaapp/Food/MyPlate.dart';
import 'package:alamaapp/Food/PlateProvider.dart';
import 'package:alamaapp/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodItemPage extends StatefulWidget {
  final dynamic item;
  final String itemType;

  const FoodItemPage({super.key, required this.item, required this.itemType});
  @override
  State<FoodItemPage> createState() => _FoodItemPageState();
}

class _FoodItemPageState extends State<FoodItemPage> {
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

  // Helper method to extract item details based on type
  String _getItemDetail(String detailType) {
    switch (widget.itemType) {
      case 'food':
        return _getFoodDetail(detailType);
      case 'coffee':
        return _getCoffeeDetail(detailType);
      case 'tea':
        return _getTeaDetail(detailType);
      case 'softDrink':
        return _getSoftDrinkDetail(detailType);
      case 'localFood':
        return _getLocalFoodDetail(detailType);
      case 'fruit':
        return _getFruitDetail(detailType);
      default:
        return "Unknown Item";
    }
  }

  // Individual detail extraction methods
  String _getFoodDetail(String detailType) {
    switch (detailType) {
      case 'name':
        return widget.item.foodName ?? "Unknown Food";
      case 'price':
        return widget.item.price?.toString() ?? "Tsh 0";
      case 'rating':
        return widget.item.foodRating?.toString() ?? "0";
      case 'preparationTime':
        return widget.item.preparationTime ?? "10 minutes";
      case 'image':
        return widget.item.foodImage ?? "./assets/default_food.png";
      case 'description':
        return widget.item.foodDescription ?? "No description";
      case 'category':
        return widget.item.category ?? "";
      default:
        return "Unknown Detail";
    }
  }

  // Similar methods for other item types (coffee, tea, etc.)
  String _getCoffeeDetail(String detailType) {
    switch (detailType) {
      case 'name':
        return widget.item.coffeeName ?? "Unknown Coffee";
      case 'price':
        return widget.item.price?.toString() ?? "Tsh 0";
      case 'rating':
        return widget.item.coffeeRating?.toString() ?? "0";
      case 'preparationTime':
        return widget.item.preparationTime ?? "5 minutes";
      case 'image':
        return widget.item.coffeeImage ?? "./assets/default_coffee.png";
      case 'description':
        return widget.item.coffeeDescription ?? "No description";
      case 'category':
        return "Coffee";
      default:
        return "Unknown Detail";
    }
  }

  // Add similar methods for tea, soft drinks, local foods, fruits
  String _getTeaDetail(String detailType) {
    switch (detailType) {
      case 'name':
        return widget.item.teaName ?? "Unknown Tea";
      case 'price':
        return widget.item.price?.toString() ?? "Tsh 0";
      case 'rating':
        return widget.item.teaRating?.toString() ?? "0";
      case 'preparationTime':
        return widget.item.preparationTime ?? "5 minutes";
      case 'image':
        return widget.item.teaImage ?? "./assets/default_tea.png";
      case 'description':
        return widget.item.teaDescription ?? "No description";
      case 'category':
        return "Tea";
      default:
        return "Unknown Detail";
    }
  }

  // Soft Drinks
  String _getSoftDrinkDetail(String detailType) {
    switch (detailType) {
      case 'name':
        return widget.item.softDrinkName ?? "Unknown Tea";
      case 'price':
        return widget.item.price?.toString() ?? "Tsh 0";
      case 'rating':
        return widget.item.softDrinkRating?.toString() ?? "0";
      case 'preparationTime':
        return widget.item.preparationTime ?? "5 minutes";
      case 'image':
        return widget.item.softDrinkImage ?? "./assets/default_softDrink.png";
      case 'description':
        return widget.item.softDrinkDescription ?? "No description";
      case 'category':
        return "Tea";
      default:
        return "Unknown Detail";
    }
  }

  // Local Foods
  String _getLocalFoodDetail(String detailType) {
    switch (detailType) {
      case 'name':
        return widget.item.localFoodName ?? "Unknown Tea";
      case 'price':
        return widget.item.price?.toString() ?? "Tsh 0";
      case 'rating':
        return widget.item.localFoodRating?.toString() ?? "0";
      case 'preparationTime':
        return widget.item.preparationTime ?? "5 minutes";
      case 'image':
        return widget.item.localFoodImage ?? "./assets/default_LocalFood.png";
      case 'description':
        return widget.item.localFoodDescription ?? "No description";
      case 'category':
        return "Tea";
      default:
        return "Unknown Detail";
    }
  }

  String _getFruitDetail(String detailType) {
    switch (detailType) {
      case 'name':
        return widget.item.fruitName ?? "Unknown Tea";
      case 'price':
        return widget.item.price?.toString() ?? "Tsh 0";
      case 'rating':
        return widget.item.fruitRating?.toString() ?? "0";
      case 'preparationTime':
        return widget.item.preparationTime ?? "5 minutes";
      case 'image':
        return widget.item.fruitImage ?? "./assets/default_fruit.png";
      case 'description':
        return widget.item.fruitDescription ?? "No description";
      case 'category':
        return "Tea";
      default:
        return "Unknown Detail";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ChangeNotifierProvider<MyPlateProvider>(
      create: (context) => MyPlateProvider(),
      child: Scaffold(
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
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _getItemDetail('name'),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: theme.brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
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
                    itemCount: 3, // Fixed to three images
                    itemBuilder: (context, index) {
                      return Container(
                        width: 300,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(List.generate(
                                3, (_) => _getItemDetail('image'))[index]),
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
                              const SizedBox(height: 160),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: SmoothPageIndicator(
                                  controller: _pageController,
                                  count:
                                      3, // Match the count to your dynamic data
                                  effect: ExpandingDotsEffect(
                                    dotColor: Colors.white,
                                    activeDotColor: Color(0xFFC18553),
                                    dotHeight: 12,
                                    dotWidth: 12,
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
                      "Tsh ${_getItemDetail('price')}",
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
                        _getItemDetail('preparationTime'),
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(CupertinoIcons.star_fill, color: Color(0xFFC18553)),
                      SizedBox(width: 5),
                      Text(
                        _getItemDetail('rating'),
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
                          _getItemDetail('description'),
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
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 28,
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
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 28,
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
                            color: Color(0xFFC18553),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "./assets/myplate.png",
                                  height: 28,
                                  width: 28,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Add to my plate",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          // Extract category from the food item
                          final String category = _getItemDetail('category');

                          // Validate category
                          if (category.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                'Category is missing or invalid!',
                                style: GoogleFonts.poppins(),
                              )),
                            );
                            return;
                          }

                          // Determine the model type based on category and add to MyPlateProvider
                          final myPlateProvider = Provider.of<MyPlateProvider>(
                              context,
                              listen: false);

                          switch (category.toLowerCase()) {
                            case 'foods':
                              myPlateProvider.addFood(
                                FoodsModel(
                                    _getItemDetail('name'),
                                    double.tryParse(_getItemDetail('rating')) ??
                                        0.0,
                                    _getItemDetail('image'),
                                    _getItemDetail('description'),
                                    _getItemDetail('preparationTime'),
                                    (_getItemDetail('price') as double?)
                                        ?.toInt(),
                                    _getItemDetail('')),
                              );
                              break;
                            case 'coffee':
                              myPlateProvider.addCoffee(
                                CoffeeModel(
                                    _getItemDetail('name'),
                                    double.tryParse(_getItemDetail('rating')) ??
                                        0.0,
                                    _getItemDetail('image'),
                                    _getItemDetail('description'),
                                    _getItemDetail('preparationTime') as int?,
                                    (_getItemDetail('price') as double?)
                                        ?.toInt() as String?,
                                    _getItemDetail('')),
                              );
                              break;
                            case 'soft drinks':
                              myPlateProvider.addSoftDrink(
                                SoftDrinksModel(
                                    _getItemDetail('name'),
                                    double.tryParse(_getItemDetail('rating')) ??
                                        0.0,
                                    _getItemDetail('image'),
                                    _getItemDetail('description'),
                                    _getItemDetail('preparationTime') as int?,
                                    (_getItemDetail('price') as double?)
                                        ?.toInt() as String?,
                                    _getItemDetail('')),
                              );
                              break;
                            case 'fruits':
                              myPlateProvider.addFruit(
                                FruitsModel(
                                    _getItemDetail('name'),
                                    double.tryParse(_getItemDetail('rating')) ??
                                        0.0,
                                    _getItemDetail('image'),
                                    _getItemDetail('description'),
                                    _getItemDetail('preparationTime') as int?,
                                    (_getItemDetail('price') as double?)
                                        ?.toInt() as String?,
                                    _getItemDetail('')),
                              );
                              break;
                            case 'tea':
                              myPlateProvider.addTea(
                                TeaModel(
                                  _getItemDetail('name'),
                                  double.tryParse(_getItemDetail('rating')) ??
                                      0.0,
                                  _getItemDetail('image'),
                                  _getItemDetail('description'),
                                  _getItemDetail('preparationTime') as int?,
                                  (_getItemDetail('price') as double?)?.toInt()
                                      as String?,
                                  _getItemDetail('') as String?,
                                ),
                              );
                              break;
                            case 'local foods':
                              myPlateProvider.addLocalFood(
                                LocalFoodsModel(
                                    _getItemDetail('name'),
                                    double.tryParse(_getItemDetail('rating')) ??
                                        0.0,
                                    _getItemDetail('image'),
                                    _getItemDetail('description'),
                                    _getItemDetail('preparationTime')
                                        as String?,
                                    (_getItemDetail('price') as double?)
                                        ?.toInt(),
                                    _getItemDetail('')),
                              );
                              break;
                            default:
                              throw Exception('Unknown category: $category');
                          }

                          // Navigate to MyPlatePage
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => MyPlatePage()),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
