import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:hyperlocal_app/widgets/shop_tile.dart';

final _firestore = FirebaseFirestore.instance;

class ShopStream extends StatelessWidget {
  const ShopStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('shops').orderBy('rating').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: kDarkPurple,
                color: kPurple,
              ),
            );
          }
          final shops = snapshot.data!.docs.reversed;
          List<Widget> shopTiles = [];
          for (var shop in shops) {
            final shopName = shop['name'];
            final shopAddress = shop['address'];
            final shopCategory = shop['category'];
            // final shopOffer = shop['offer'];
            final shopRating = shop['rating'];
            final shopTile = ShopTile(
              address: shopAddress,
              category: shopCategory,
              storeName: shopName,
              storeRating: shopRating,
            );
            shopTiles.add(shopTile);
          }
          return Expanded(
            child: ListView(
              children: shopTiles,
            ),
          );
        });
  }
}
