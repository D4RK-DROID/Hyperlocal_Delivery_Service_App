import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:hyperlocal_app/widgets/category_tile.dart';

final _firestore = FirebaseFirestore.instance;

class CategoryStream extends StatelessWidget {
  const CategoryStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('categories').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: kDarkPurple,
                color: kPurple,
              ),
            );
          }
          final categories = snapshot.data!.docs.reversed;
          List<Widget> categoryTiles = [];
          for (var category in categories) {
            final categoryName = category['category'];
            final imageURL = category['image'];
            final categoryTile = CategoryTile(
              categoryName: categoryName,
              imageURL: imageURL,
            );
            categoryTiles.add(categoryTile);
          }
          var halfList = categoryTiles.length / 2;
          List<Widget> categoryTiles1 =
              categoryTiles.sublist(0, halfList.toInt());
          List<Widget> categoryTiles2 =
              categoryTiles.sublist(halfList.toInt(), categoryTiles.length);
          return Expanded(
            child: ListView(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: categoryTiles2,
                  ),
                  Column(
                    children: categoryTiles1,
                  )
                ],
              ),
            ]),
          );
        });
  }
}
