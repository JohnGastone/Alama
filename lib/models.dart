class FoodsModel {
  String? foodName;
  double? foodRating;
  String? foodImage;
  String? foodDescription;
  String? preparationTime;
  int? price;
  String? category;

  FoodsModel(this.foodName, this.foodRating, this.foodImage,
      this.foodDescription, this.preparationTime, this.price, this.category);
}

class FoodsModelData {
  static List<FoodsModel> getFoods = [
    FoodsModel(
        "Biryani Kuku",
        4.9,
        "./assets/biryanikuku.png",
        "A flavorful Tanzanian rice dish cooked with chicken, spices, and vegetables.",
        "15 min",
        15000,
        ''),
    FoodsModel(
        "Chips Kavu",
        4.9,
        "./assets/chipskavu.png",
        "Crispy French fries (chips), a popular Tanzanian street food.",
        "15 min",
        7500,
        ''),
    FoodsModel(
        "Wali Kuku",
        4.9,
        "./assets/walikuku.png",
        "Traditional Tanzanian rice dish cooked with tender chicken and aromatic spices.",
        "15 min",
        12000,
        ''),
    FoodsModel(
        "Wali Nyama",
        4.9,
        "./assets/walinyama.png",
        "Hearty Tanzanian rice dish served with delicious beef stew.",
        "15 min",
        10000,
        ''),
    FoodsModel(
        "Biryani Kuku",
        4.9,
        "./assets/biryanikuku.png",
        "A flavorful Tanzanian rice dish cooked with chicken, spices, and vegetables.",
        "15 min",
        15000,
        ''),
    FoodsModel(
        "Chips Kavu",
        4.9,
        "./assets/chipskavu.png",
        "Crispy French fries (chips), a popular Tanzanian street food.",
        "15 min",
        7500,
        ''),
    FoodsModel(
        "Wali Kuku",
        4.9,
        "./assets/walikuku.png",
        "Traditional Tanzanian rice dish cooked with tender chicken and aromatic spices.",
        "15 min",
        12000,
        ''),
    FoodsModel(
        "Wali Nyama",
        4.9,
        "./assets/walinyama.png",
        "Hearty Tanzanian rice dish served with delicious beef stew.",
        "15 min",
        10000,
        ''),
    FoodsModel(
        "Biryani Kuku",
        4.9,
        "./assets/biryanikuku.png",
        "A flavorful Tanzanian rice dish cooked with chicken, spices, and vegetables.",
        "15 min",
        15000,
        ''),
    FoodsModel(
        "Chips Kavu",
        4.9,
        "./assets/chipskavu.png",
        "Crispy French fries (chips), a popular Tanzanian street food.",
        "15 min",
        7500,
        ''),
    FoodsModel(
        "Wali Kuku",
        4.9,
        "./assets/walikuku.png",
        "Traditional Tanzanian rice dish cooked with tender chicken and aromatic spices.",
        "15 min",
        12000,
        ''),
    FoodsModel(
        "Wali Nyama",
        4.9,
        "./assets/walinyama.png",
        "Hearty Tanzanian rice dish served with delicious beef stew.",
        "15 min",
        10000,
        ''),
    FoodsModel(
        "Biryani Kuku",
        4.9,
        "./assets/biryanikuku.png",
        "A flavorful Tanzanian rice dish cooked with chicken, spices, and vegetables.",
        "15 min",
        15000,
        ''),
    FoodsModel(
        "Chips Kavu",
        4.9,
        "./assets/chipskavu.png",
        "Crispy French fries (chips), a popular Tanzanian street food.",
        "15 min",
        7500,
        ''),
    FoodsModel(
        "Wali Kuku",
        4.9,
        "./assets/walikuku.png",
        "Traditional Tanzanian rice dish cooked with tender chicken and aromatic spices.",
        "15 min",
        12000,
        ''),
    FoodsModel(
        "Wali Nyama",
        4.9,
        "./assets/walinyama.png",
        "Hearty Tanzanian rice dish served with delicious beef stew.",
        "15 min",
        10000,
        ''),
  ];

  static List<FoodsModel> displayFoods = List.from(FoodsModelData.getFoods);
}

class CoffeeModel {
  String? coffeeName;
  double? coffeeRating;
  String? coffeeImage;
  String? preparationTime;
  int? price;
  String? category;
  String? coffeeDescription;

  CoffeeModel(this.coffeeName, this.coffeeRating, this.coffeeImage,
      this.preparationTime, this.price, this.category, this.coffeeDescription);
}

class CoffeeModelData {
  static List<CoffeeModel> getCoffee = [
    CoffeeModel(
        "Arabica Coffee",
        4.9,
        "./assets/arabica.jpeg",
        "5 min",
        5000,
        '',
        "A smooth, elegant coffee from high-altitude regions, featuring delicate notes of berries and a hint of chocolate."),
    CoffeeModel(
        "Liberica Coffee",
        4.9,
        "./assets/liberica.jpeg",
        "5 min",
        7500,
        '',
        "A rare and bold coffee variety with a distinctive woody character, offering an intense and slightly smoky flavor profile."),
    CoffeeModel("Milky Coffee", 4.9, "./assets/milky.jpeg", "5 min", 12000, '',
        "A comforting blend of rich espresso and creamy milk, creating a harmonious balance of strength and smoothness."),
    CoffeeModel(
        "Robusta Coffee",
        4.9,
        "./assets/robusta.jpeg",
        "5 min",
        10000,
        '',
        "An intense, full-bodied coffee known for its strong, earthy flavor and high caffeine content, perfect for those seeking a robust brew."),
    CoffeeModel("Nguu Coffee", 4.9, "./assets/nguu.jpeg", "5 min", 10000, '',
        "A distinguished Tanzanian coffee revealing complex layers of flavor, with bright acidity and notes of dark chocolate and wild berries."),
    CoffeeModel("Tanga Coffee", 4.9, "./assets/tanga.jpeg", "5 min", 12000, '',
        "A vibrant Tanzanian coffee celebrated for its crisp acidity, featuring bright citrus undertones and a clean, refreshing finish.")
  ];

  static List<CoffeeModel> displayCoffee = List.from(CoffeeModelData.getCoffee);
}

class SoftDrinksModel {
  String? softDrinkName;
  double? softDrinkRating;
  String? softDrinkImage;
  String? preparationTime;
  int? price;
  String? category;
  String? softDrinkDescription;

  SoftDrinksModel(
      this.softDrinkName,
      this.softDrinkRating,
      this.softDrinkImage,
      this.preparationTime,
      this.price,
      this.category,
      this.softDrinkDescription);
}

class SoftDrinksModelData {
  static List<SoftDrinksModel> getSoftDrinks = [
    SoftDrinksModel(
        "Cocktail",
        4.9,
        "./assets/cocktail.jpeg",
        "5 min",
        5000,
        '',
        "An artfully crafted blend of fresh fruit juices, spirits, and garnishes that dance together in a symphony of flavors and colors."),
    SoftDrinksModel("Sprite", 4.9, "./assets/sprite.jpeg", "5 min", 7500, '',
        "A crisp, effervescent lemon-lime soda that offers a bright, clean refreshment with a perfectly balanced sweet and tangy profile."),
    SoftDrinksModel("Pepsi", 4.9, "./assets/pepsi.jpeg", "5 min", 12000, '',
        "An iconic cola with a rich, caramel-like sweetness and subtle citrus notes, delivering a classic and satisfying soft drink experience."),
    SoftDrinksModel("Mountain Dew", 4.9, "./assets/dew.jpeg", "5 min", 5000, '',
        "An electrifying citrus soda bursting with intense, tropical-inspired flavor and a signature caffeine kick that energizes and excites."),
    SoftDrinksModel("Coca-Cola", 4.9, "./assets/coke.jpeg", "5 min", 10000, '',
        "The world's most beloved cola, offering a perfectly balanced blend of sweetness, carbonation, and a secret recipe that has delighted generations."),
    SoftDrinksModel(
        "Orange Juice",
        4.9,
        "./assets/orangejuice.jpeg",
        "5 min",
        10000,
        '',
        "A pure, sunshine-in-a-glass beverage, freshly squeezed to capture the bright, natural sweetness and vibrant nutrition of ripe oranges.")
  ];

  static List<SoftDrinksModel> displaySoftDrinks =
      List.from(SoftDrinksModelData.getSoftDrinks);
}

class FruitsModel {
  String? fruitName;
  double? fruitRating;
  String? fruitImage;
  String? preparationTime;
  int? price;
  String? category;
  String? fruitDescription;

  FruitsModel(this.fruitName, this.fruitRating, this.fruitImage,
      this.preparationTime, this.price, this.category, this.fruitDescription);
}

class FruitsModelData {
  static List<FruitsModel> getFruits = [
    FruitsModel("Banana", 4.9, "./assets/banana.jpeg", "5 min", 5000, '',
        "A sweet, creamy fruit, often enjoyed as a snack or dessert."),
    FruitsModel("Mango", 4.9, "./assets/mango.jpeg", "5 min", 7500, '',
        "A juicy and flavorful tropical fruit with a sweet and tangy taste."),
    FruitsModel("Grapes", 4.9, "./assets/grapes.jpeg", "5 min", 12000, '',
        "Small, sweet berries that come in various colors, such as green, red, and purple."),
    FruitsModel("Orange", 4.9, "./assets/orange.jpeg", "5 min", 10000, '',
        "A citrus fruit with a vibrant, sweet, and tangy flavor."),
    FruitsModel(
        "Passion Fruit",
        4.9,
        "./assets/passion.jpeg",
        "5 min",
        5000,
        '',
        "A tropical fruit with a unique, tart, and sweet flavor, often used in juices and desserts."),
    FruitsModel("Pineapple", 4.9, "./assets/pineapple.jpeg", "5 min", 7500, '',
        "A large, spiky fruit with a sweet, tangy, and refreshing taste."),
    FruitsModel("Watermelon", 4.9, "./assets/watermelon.jpeg", "5 min", 12000,
        '', "A large, refreshing fruit with a juicy, sweet, and watery flesh."),
    FruitsModel("Orange", 4.9, "./assets/orange.jpeg", "5 min", 10000, '',
        "A citrus fruit with a vibrant, sweet, and tangy flavor."),
    FruitsModel("Grapes", 4.9, "./assets/grapes.jpeg", "5 min", 5000, '',
        "Small, sweet berries that come in various colors, such as green, red, and purple."),
    FruitsModel("Mango", 4.9, "./assets/mango.jpeg", "5 min", 7500, '',
        "A juicy and flavorful tropical fruit with a sweet and tangy taste."),
    FruitsModel("Banana", 4.9, "./assets/banana.jpeg", "5 min", 12000, '',
        "A sweet, creamy fruit, often enjoyed as a snack or dessert."),
    FruitsModel(
        "Passion Fruit",
        4.9,
        "./assets/passion.jpeg",
        "5 min",
        10000,
        '',
        "A tropical fruit with a unique, tart, and sweet flavor, often used in juices and desserts."),
    FruitsModel("Grapes", 4.9, "./assets/grapes.jpeg", "5 min", 5000, '',
        "Small, sweet berries that come in various colors, such as green, red, and purple."),
    FruitsModel("Pineapple", 4.9, "./assets/pineapple.jpeg", "5 min", 7500, '',
        "A large, spiky fruit with a sweet, tangy, and refreshing taste."),
    FruitsModel("Watermelon", 4.9, "./assets/watermelon.jpeg", "5 min", 12000,
        '', "A large, refreshing fruit with a juicy, sweet, and watery flesh."),
    FruitsModel("Orange", 4.9, "./assets/orange.jpeg", "5 min", 10000, '',
        "A citrus fruit with a vibrant, sweet, and tangy flavor."),
  ];

  static List<FruitsModel> displayFruits = List.from(FruitsModelData.getFruits);
}

class TeaModel {
  String? teaName;
  double? teaRating;
  String? teaImage;
  String? preparationTime;
  int? price;
  String? category;
  String? teaDescription;

  TeaModel(this.teaName, this.teaRating, this.teaImage, this.preparationTime,
      this.price, this.category, this.teaDescription);
}

class TeaModelData {
  static List<TeaModel> getTea = [
    TeaModel("Black Tea", 4.9, "./assets/blacktea.jpeg", "5 min", 5000, '',
        "A bold and complex brew with a rich, full-bodied character, offering deep, malty notes that awaken the senses and provide a robust morning companion."),
    TeaModel("Green Tea", 4.9, "./assets/greentea.jpeg", "5 min", 7500, '',
        "A delicate symphony of earthy and grassy flavors, celebrated for its subtle complexity and remarkable health-promoting antioxidants."),
    TeaModel("Matcha Tea", 4.9, "./assets/matcha.jpg", "5 min", 12000, '',
        "A ceremonial Japanese green tea transformed into a vibrant powder, delivering an intense, umami-rich experience with a brilliant emerald color and meditative preparation."),
    TeaModel("Orange Tea", 4.9, "./assets/orangetea.jpeg", "5 min", 10000, '',
        "A harmonious blend of bright black tea and zesty orange peel, creating a refreshing infusion that dances between citrusy brightness and classic tea depth."),
    TeaModel("Vanilla Tea", 4.9, "./assets/tea.jpeg", "5 min", 5000, '',
        "A luxurious and comforting brew that marries the warmth of premium tea leaves with the smooth, sweet embrace of pure vanilla essence."),
    TeaModel("Yerba Mate Tea", 4.9, "./assets/Yerba.jpeg", "5 min", 7500, '',
        "A traditional South American herbal infusion renowned for its invigorating energy, offering an earthy, slightly smoky flavor that connects drinkers to ancient cultural practices.")
  ];

  static List<TeaModel> displayTea = List.from(TeaModelData.getTea);
}

class LocalFoodsModel {
  String? localFoodName;
  double? localFoodRating;
  String? localFoodImage;
  String? localFoodDescription; // Added this line for the description
  String? preparationTime;
  int? price;
  String? category;

  LocalFoodsModel(
      this.localFoodName,
      this.localFoodRating,
      this.localFoodImage,
      this.localFoodDescription,
      this.preparationTime,
      this.price,
      this.category); // Include the description parameter
}

class LocalFoodsList {
  static List<LocalFoodsModel> getLocalFoods = [
    LocalFoodsModel(
        "Biryani",
        4.9,
        "./assets/biryani.png",
        "A flavorful rice dish made with fragrant spices, vegetables, and meat (optional), offering a rich and aromatic experience.",
        "15 min",
        5000,
        'Main Course'),
    LocalFoodsModel(
        "Pilau",
        4.9,
        "./assets/pilau.png",
        "A spiced rice dish cooked with meat, vegetables, and a blend of aromatic spices, perfect for a hearty meal.",
        "15 min",
        7500,
        'Main Course'),
    LocalFoodsModel(
        "Wali Nazi",
        4.9,
        "./assets/nazi.png",
        "A coconut-infused rice dish, often served with fish, chicken, or meat curry, bringing tropical flavors to your plate.",
        "15 min",
        12000,
        'Side Dish'),
    LocalFoodsModel(
        "Ndizi Mzuzu",
        4.9,
        "./assets/mzuzu.png",
        "Roasted plantains, a popular side dish or snack in Tanzania, known for their sweet and savory taste.",
        "5 min",
        10000,
        'Snack'),
    LocalFoodsModel(
        "Chips Mayai",
        4.9,
        "./assets/chips.png",
        "A hearty Tanzanian street food made with french fries cooked into an omelette, offering a unique blend of textures.",
        "5 min",
        5000,
        'Snack'),
    LocalFoodsModel(
        "Pilau Zenji",
        4.9,
        "./assets/pilauzanzibar.png",
        "A fragrant and flavorful pilau with Zanzibari spices, often cooked with seafood or meat, perfect for special occasions.",
        "5 min",
        5000,
        'Main Course'),
  ];

  static List<LocalFoodsModel> displayLocalFoods =
      List.from(LocalFoodsList.getLocalFoods);
}

class PaymentMethodsModel {
  String? paymentMethod;
  String? paymentImage;

  PaymentMethodsModel(this.paymentMethod, this.paymentImage);
}

class PaymentMethodModelData {
  static List<PaymentMethodsModel> getPaymentMethods = [
    PaymentMethodsModel("Mobile Money", "./assets/operation.png"),
    PaymentMethodsModel("Visa / Mastercard", "./assets/logo.png"),
    PaymentMethodsModel("Lipa Namba", "./assets/lipa.png"),
    PaymentMethodsModel("Cash", "./assets/cash-on-delivery.png"),
  ];
  static List<PaymentMethodsModel> displayPaymentMethods =
      List.from(PaymentMethodModelData.getPaymentMethods);
}
