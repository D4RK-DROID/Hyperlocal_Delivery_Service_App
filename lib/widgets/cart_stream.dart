import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cart_tile.dart';

final _firestore = FirebaseFirestore.instance;
int totalAmount = 0;

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
            final cartId = product.id;
            final productName = product['productName'];
            final productQuantity = product['productQuantity'];
            final productPackaging = product['productPackaging'];
            final productPrice = product['productPrice'];
            final productImage = product['image'];
            final buyingQuantity = product['buyingQuantity'];
            int cartTotal = buyingQuantity * productPrice;
            totalAmount = totalAmount + cartTotal;
            final cartTile = CartTile(
              productName: productName,
              productQuantity: productQuantity,
              productPackaging: productPackaging,
              productPrice: productPrice,
              imageURL: productImage,
              buyingQuantity: buyingQuantity,
              cartId: cartId,
            );
            cartTiles.add(cartTile);
          }

          final Widget amountText = Text(
            'Total Amount: $totalAmount₹',
            style: kHeadingTextStyle,
          );
          cartTiles.insert(0, amountText);
          final Widget buyButton = TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kWhite,
              ),
              child: Text(
                'Proceed to Buy',
                style: kHeadingTextStyle.copyWith(
                  color: kDarkPurple,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
          cartTiles.insert(1, buyButton);
          const cartText = Text(
            'Cart Items',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Oxygen',
              fontWeight: FontWeight.bold,
            ),
          );
          cartTiles.insert(2, cartText);
          totalAmount = 0;
          return Expanded(
            child: ListView(
              children: cartTiles,
            ),
          );
        });
  }
}
