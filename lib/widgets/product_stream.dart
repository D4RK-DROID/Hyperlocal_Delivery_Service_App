import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:hyperlocal_app/widgets/product_tile.dart';

final _firestore = FirebaseFirestore.instance;

class ProductStream extends StatelessWidget {
  const ProductStream({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('products')
            .where('category', isEqualTo: categoryName)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: kDarkPurple,
                color: kPurple,
              ),
            );
          }
          final products = snapshot.data!.docs.reversed;
          List<Widget> productTiles = [];
          for (var product in products) {
            final productName = product['name'];
            final productQuantity = product['quantity'];
            final productPackaging = product['packaging'];
            final productPrice = product['price'];
            final storeName = product['store'];
            final productRating = product['rating'];
            final productTile = ProductTile(
              productName: productName,
              productQuantity: productQuantity,
              productPackaging: productPackaging,
              productPrice: productPrice,
              storeName: storeName,
              productRating: productRating,
            );
            productTiles.add(productTile);
          }
          return Expanded(
            child: ListView(
              children: productTiles,
            ),
          );
        });
  }
}
