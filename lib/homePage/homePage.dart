import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:task/cartpage/Cartpage.dart';
import 'package:task/drawer/drawer.dart';
import 'package:task/homePage/HomeDetail/detailpage.dart';

import 'homePage_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NumberFormat indianRupeeFormat = NumberFormat.currency(
      symbol: '₹',
      locale: 'en_IN',
      decimalDigits: 0,
    );
    final productController = Get.put(HomePageController());
    Timer? debounce;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.secondary),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: Text("Item List"),
          titleTextStyle: TextStyle(color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(cartpage());
                },
                icon: Icon(Icons.shopping_bag_sharp))
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black45,
                    decoration: InputDecoration(
                        hintText: "Search items....",
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.secondary))),
                    onChanged: (value) {
                      if (debounce?.isActive ?? false) {
                        debounce?.cancel();
                      }
                      debounce = Timer(const Duration(milliseconds: 900), () {
                        productController.searchQuery.value = value;
                      });
                    }),
              ))),
      drawer: DrawerPage(),
      body: Column(
        children: [
          _buildCategoryList(productController),
          Expanded(
            child: Obx(
              () {
                final filteredProducts = productController.filteredProducts();

                if (filteredProducts.isEmpty) {
                  return const Center(child: Text("No Data Found."));
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: filteredProducts
                      .length, // Use null-conditional operator here
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    final String productName = product["name"] ?? "UnKnown";
                    final double price = (product["price"] ?? 0).toDouble();
                    final String imageUrl = product["image url"] ??
                        "https://via.placeholder.com/150";
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => Detailpage(product: product));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Card(
                          color: Theme.of(context).colorScheme.surface,
                          elevation: 5,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: product["image url"] ??
                                    "https://via.placeholder.com/150",
                                // Default image
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(product["name"] ?? "No Name",
                                              style: GoogleFonts.nunito(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600)),
                                          Text(
                                              indianRupeeFormat
                                                  .format(product["price"] ?? 0)
                                                  .toString(),
                                              style: GoogleFonts.nunito(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14)),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5.0, bottom: 3.0),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )),
                                          onPressed: () {
                                            productController.addTocart(
                                                productName, price, imageUrl);
                                          },
                                          child: Text(
                                            "Add to cart",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCategoryList(HomePageController productController) {
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
  return SizedBox(
    height: 90,
    child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              productController.changeCategory(category["name"]!);
            },
            child: Obx(() {
              bool isSelected =
                  productController.selectedCategory.value == category["name"];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                // padding: EdgeInsets.all(),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: isSelected ? Colors.green : Colors.grey,
                      width: isSelected ? 3 : 1),
                ),
                child: CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(category["image"]!),
                  radius: 30,
                ),
              );
            }),
          );
        }),
  );
}
