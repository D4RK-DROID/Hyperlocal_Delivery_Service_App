import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart_tile.dart';

final _firestore = FirebaseFirestore.instance;

class CartStream extends StatelessWidget {
  const CartStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('cart_items')
            .where('email', isEqualTo: 'aadil@hyperlocal.com')
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
          List<Widget> cartTiles = [];
          for (var product in products) {
            final productName = product['productName'];
            final productQuantity = product['productQuantity'];
            final productPackaging = product['productPackaging'];
            final productPrice = product['productPrice'];
            final productImage = product['image'];
            final buyingQuantity = product['buyingQuantity'];
            final cartTile = CartTile(
              productName: productName,
              productQuantity: productQuantity,
              productPackaging: productPackaging,
              productPrice: productPrice,
              imageURL: productImage,
              buyingQuantity: buyingQuantity,
            );
            cartTiles.add(cartTile);
          }
          return Expanded(
            child: ListView(
              children: cartTiles,
            ),
          );
        });
  }
}
