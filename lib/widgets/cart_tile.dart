import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class CartTile extends StatelessWidget {
  const CartTile({
    Key? key,
    required this.imageURL,
    required this.productName,
    required this.productQuantity,
    required this.productPackaging,
    required this.productPrice,
    required this.buyingQuantity,
    required this.cartId,
  }) : super(key: key);
  final String imageURL;
  final String productName;
  final String productQuantity;
  final String productPackaging;
  final int productPrice;
  final int buyingQuantity;
  final String cartId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: kPurple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(5),
            child: Image(
              image: NetworkImage(imageURL),
              width: 70,
              height: 70,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$productName $productQuantity - $productPackaging',
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Oxygen',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'MRP: $productPrice₹',
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Oxygen',
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Quantity: $buyingQuantity',
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Oxygen',
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('cart_items').doc(cartId).delete();
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.cancel,
                        color: kWhite,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
