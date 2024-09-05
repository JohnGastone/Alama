import 'package:alamaapp/models.dart';
import 'package:flutter/foundation.dart';

class MyPlateProvider with ChangeNotifier {
  final List<FoodsModel> _myPlate = [];

  List<FoodsModel> get myPlate => _myPlate;

  void addToPlate(FoodsModel foodItem) {
    _myPlate.add(foodItem);
    notifyListeners();
  }
}
