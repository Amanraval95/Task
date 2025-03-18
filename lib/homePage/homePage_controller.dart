import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePageController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  //          TO STORE PRODUCT DATA
  final RxList<Map<String, dynamic>> _products = <Map<String, dynamic>>[].obs;

  //          GETTER FOR PRODUCT
  List<Map<String, dynamic>> get products => _products;

  //          Quantity Tracker
  final RxMap<String, int> quantities = <String, int>{}.obs;
  final searchQuery = "".obs;
//            To Store Cart Items
  final RxMap<String, Map<String, dynamic>> cartitems =
      <String, Map<String, dynamic>>{}.obs;
  //          DEFAULT CATEGORY
  final RxString selectedCategory = "Tomato".obs;
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    loadCartData();
  }

  Future<void> fetchProducts() async {
    try {
      final querySnapshot =
          await _firestore.collection(selectedCategory.value).get();
      _products.value = querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print(" error $e");
    }
  }

  List<Map<String, dynamic>> filteredProducts() {
    if (searchQuery.value.isEmpty) {
      return _products;
    } else {
      return _products
          .where((products) => products["name"]
              .toString()
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void changeCategory(String category) {
    selectedCategory.value = category;
    fetchProducts();
  }

  void addTocart(String productName, double price, String imageUrl) {
    if (cartitems.containsKey(productName)) {
      return null;
    } else {
      cartitems[productName] = {
        "price": price,
        "quantity": 1,
        "image url": imageUrl
      };
      saveCartData();
    }
  }

  void incrementQuantity(String productName) {
    if (cartitems.containsKey(productName)) {
      cartitems.update(productName, (existingItem) {
        return {
          "price": existingItem["price"],
          "quantity": existingItem["quantity"] + 1,
          "image url": existingItem["image url"]
        };
      });
      saveCartData();
    } else {
      quantities[productName] = 1;
    }
  }

  void decrementQuantity(String productName) {
    if (quantities.containsKey(productName) && quantities[productName]! > 0) {
      quantities[productName] = quantities[productName]! - 1;
      if (quantities[productName] == 0) {
        quantities.remove(productName);
      }
      saveCartData();
    }
  }

  void removeFromCart(String productName) {
    cartitems.remove(productName);
    saveCartData();
  }

  void saveCartData() {
    storage.write("cart", cartitems);
  }

  void loadCartData() {
    var savedCart = storage.read<Map<String, dynamic>>("cart");
    if (savedCart != null) {
      cartitems.assignAll(savedCart
          .map((key, value) => MapEntry(key, value as Map<String, dynamic>)));
    }
  }
}
