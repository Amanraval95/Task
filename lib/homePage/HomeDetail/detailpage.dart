import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Detailpage extends StatelessWidget {
  final Map<String, dynamic> product;
  const Detailpage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: SafeArea(
          child: Column(
            children: [
              VxArc(
                height: 30,
                arcType: VxArcType.convex,
                edge: VxEdge.bottom,
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: CachedNetworkImage(
                    imageUrl: product["image url"],
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height *
                        0.4, // Adjust as needed
                  ),
                ),
              ),
              // Expanded(
              //   child: Container(
              //     color: Theme.of(context).colorScheme.onPrimary,
              //     width: double.infinity,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
