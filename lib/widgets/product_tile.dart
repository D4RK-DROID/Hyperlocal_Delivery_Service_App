import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:hyperlocal_app/screens/buying_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.productId,
    required this.productName,
    required this.productQuantity,
    required this.productPackaging,
    required this.productPrice,
    required this.storeName,
    required this.productRating,
    required this.imageURL,
    required this.productStock,
  }) : super(key: key);
  final String productId;
  final String productName;
  final String productQuantity;
  final String productPackaging;
  final int productPrice;
  final String storeName;
  final int productRating;
  final String imageURL;
  final int productStock;

  @override
  Widget build(BuildContext context) {
    List<Widget> review = [];
    for (var i = 0; i < productRating; i++) {
      Icon reviewIcon = const Icon(
        Icons.star,
        size: 16,
        color: kYellow,
      );
      review.add(reviewIcon);
    }
    for (var i = 0; i < 5 - productRating; i++) {
      Icon reviewIcon = const Icon(
        Icons.star_outline,
        size: 16,
        color: kYellow,
      );
      review.add(reviewIcon);
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BuyingScreen(
              productId: productId,
              productName: productName,
              productQuantity: productQuantity,
              productPackaging: productPackaging,
              productPrice: productPrice,
              productRating: productRating,
              storeName: storeName,
              imageUrl: imageURL,
              productStock: productStock,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kPurple,
        ),
        child: Row(
          children: [
            Container(
              child: Image(
                image: NetworkImage(imageURL),
                width: 130,
                height: 120,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kWhite,
              ),
              height: 130,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$productName, $productQuantity - \n$productPackaging',
                  style: const TextStyle(
                    fontFamily: 'Oxygen',
                  ),
                ),
                Text(
                  '₹$productPrice/$productQuantity',
                  style: const TextStyle(
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: review,
                ),
                Text(
                  'Sold by: $storeName',
                  style: const TextStyle(
                    fontFamily: 'Oxygen',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _firestore.collection('cart_items').add({
                      'email': 'aadil@hyperlocal.com',
                      'storeName': storeName,
                      'buyingQuantity': 1,
                      'productName': productName,
                      'productPackaging': productPackaging,
                      'productQuantity': productQuantity,
                      'productPrice': productPrice,
                      'image': imageURL,
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    height: 30,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: kWhite),
                    child: const Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          color: kDarkPurple,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          fontFamily: 'Oxygen',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
