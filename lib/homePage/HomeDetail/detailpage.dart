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
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              // Image that spans the entire screen
              CachedNetworkImage(
                imageUrl: product["image url"],
                fit: BoxFit.cover,
                // height: double.infinity,
                width: MediaQuery.of(context).size.width,
              ),
              Column(
                children: [
                  // Arc overlay with expanded space below
                  SizedBox(
                    height: 300, // Same height as the image
                  ),
                  Expanded(
                    child: VxArc(
                      height: 30,
                      arcType: VxArcType.convey,
                      edge: VxEdge.top,
                      child: Container(
                        color: Theme.of(context).colorScheme.secondary,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
