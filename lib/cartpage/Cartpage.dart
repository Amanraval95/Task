import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../homePage/homePage_controller.dart';

class cartpage extends StatelessWidget {
  const cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    NumberFormat indianRupeeFormat = NumberFormat.currency(
      symbol: '₹',
      locale: 'en_IN',
      decimalDigits: 0,
    );
    final productController = Get.find<HomePageController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Your Cart"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer),
      body: Obx(() {
        if (productController.cartitems.isEmpty) {
          return Center(
              child: Text(
            "Your Cart is empty",
            style: TextStyle(fontSize: 18),
          ));
        }
        return ListView.builder(
            itemCount: productController.cartitems.length,
            itemBuilder: (context, index) {
              final String productName =
                  productController.cartitems.keys.elementAt(index);
              final Map<String, dynamic> product =
                  productController.cartitems[productName]!;
              return Card(
                margin: EdgeInsets.all(10),
                elevation: 4,
                child: ListTile(
                  leading: Image.network(
                    product["image url"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    productName,
                    style: GoogleFonts.nunito(
                        fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                      "${indianRupeeFormat.format(product["price"])}x ${product["quantity"]}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () =>
                              productController.decrementQuantity(productName),
                          icon: Icon(
                            Icons.remove,
                            color: Theme.of(context).colorScheme.primary,
                          )),
                      IconButton(
                          onPressed: () =>
                              productController.incrementQuantity(productName),
                          icon: Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.primary,
                          )),
                      IconButton(
                          onPressed: () =>
                              productController.removeFromCart(productName),
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.primary,
                          ))
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
