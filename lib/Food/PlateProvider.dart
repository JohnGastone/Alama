import 'package:flutter/foundation.dart';
import 'package:alamaapp/models.dart'; // Ensure all models are defined and imported

class MyPlateProvider with ChangeNotifier {
  // Category-specific lists
  final List<FoodsModel> _foods = [];
  final List<CoffeeModel> _coffee = [];
  final List<SoftDrinksModel> _softDrinks = [];
  final List<FruitsModel> _fruits = [];
  final List<TeaModel> _tea = [];
  final List<LocalFoodsModel> _localFoods = [];

  // General list for all items
  final List<dynamic> _myPlate = [];

  // Getters for each category
  List<FoodsModel> get foods => _foods;
  List<CoffeeModel> get coffee => _coffee;
  List<SoftDrinksModel> get softDrinks => _softDrinks;
  List<FruitsModel> get fruits => _fruits;
  List<TeaModel> get tea => _tea;
  List<LocalFoodsModel> get localFoods => _localFoods;

  // Getter for the general plate
  List<dynamic> get myPlate => _myPlate;

  // Methods to add items to each category and general plate
  void addFood(FoodsModel foodItem) {
    _foods.add(foodItem);
    _addToPlate(foodItem);
  }

  void addCoffee(CoffeeModel coffeeItem) {
    _coffee.add(coffeeItem);
    _addToPlate(coffeeItem);
  }

  void addSoftDrink(SoftDrinksModel drinkItem) {
    _softDrinks.add(drinkItem);
    _addToPlate(drinkItem);
  }

  void addFruit(FruitsModel fruitItem) {
    _fruits.add(fruitItem);
    _addToPlate(fruitItem);
  }

  void addTea(TeaModel teaItem) {
    _tea.add(teaItem);
    _addToPlate(teaItem);
  }

  void addLocalFood(LocalFoodsModel foodItem) {
    _localFoods.add(foodItem);
    _addToPlate(foodItem);
  }

  // Internal method to add any item to the general plate
  void _addToPlate(dynamic item) {
    _myPlate.add(item);
    notifyListeners();
  }

  // Clear all items in a specific category
  void clearFoods() {
    _foods.clear();
    _syncPlate();
  }

  void clearCoffee() {
    _coffee.clear();
    _syncPlate();
  }

  void clearSoftDrinks() {
    _softDrinks.clear();
    _syncPlate();
  }

  void clearFruits() {
    _fruits.clear();
    _syncPlate();
  }

  void clearTea() {
    _tea.clear();
    _syncPlate();
  }

  void clearLocalFoods() {
    _localFoods.clear();
    _syncPlate();
  }

  // Sync the general plate with all category-specific lists
  void _syncPlate() {
    _myPlate
      ..clear()
      ..addAll(_foods)
      ..addAll(_coffee)
      ..addAll(_softDrinks)
      ..addAll(_fruits)
      ..addAll(_tea)
      ..addAll(_localFoods);
    notifyListeners();
  }
}
