import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePageController extends GetxController {
  List<Map<String, String>> categories = [
    {
      "name": "Tomato",
      "image": "https://i.postimg.cc/85T3nrjR/Tomato-icon.png"
    },
    {
      "name": "Potato",
      "image": "https://i.postimg.cc/vBpPwgm2/potato-icon.png"
    },
    {
      "name": "Onion",
      "image": "https://cdn-icons-png.flaticon.com/256/6531/6531396.png"
    },
    {
      "name": "Chilli",
      "image": "https://cdn-icons-png.flaticon.com/256/6531/6531382.png"
    },
    {
      "name": "Capsicum",
      "image":
          "https://i.postimg.cc/VNJysN20/pngtree-bell-pepper-flat-icon-vector-png-image-15525252.png"
    },
  ];

  final _firestore = FirebaseFirestore.instance;

  final RxList<Map<String, dynamic>> _products =
      <Map<String, dynamic>>[].obs; //          TO STORE PRODUCT DATA

  List<Map<String, dynamic>> get products =>
      _products; //          GETTER FOR PRODUCT

  final RxMap<String, int> quantities =
      <String, int>{}.obs; //          Quantity Tracker

  //
  final searchQuery = "".obs;

  final RxMap<String, Map<String, dynamic>> cartitems =
      <String, Map<String, dynamic>>{}.obs; //            To Store Cart Items

  final RxString selectedCategory = "Tomato".obs; //          DEFAULT CATEGORY
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
    if (cartitems.containsKey(productName)) {
      final currentQuantity = cartitems[productName]!["quantity"];
      if (currentQuantity > 1) {
        cartitems.update(productName, (existingItem) {
          return {
            "price": existingItem["price"],
            "quantity": currentQuantity - 1,
            "image url": existingItem["image url"]
          };
        });
      } else {
        // Quantity is 1, so remove the item completely
        cartitems.remove(productName);
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
