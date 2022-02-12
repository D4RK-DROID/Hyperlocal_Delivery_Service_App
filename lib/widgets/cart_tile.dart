import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    Key? key,
    required this.imageURL,
    required this.productName,
    required this.productQuantity,
    required this.productPackaging,
    required this.productPrice,
    required this.buyingQuantity,
  }) : super(key: key);
  final String imageURL;
  final String productName;
  final String productQuantity;
  final String productPackaging;
  final int productPrice;
  final int buyingQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: kPurple,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(5),
            child: Image(
              image: NetworkImage(imageURL),
              width: 70,
              height: 50,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$productName $productQuantity - $productPackaging',
                style: const TextStyle(
                  fontSize: 16,
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
                      fontSize: 16,
                      fontFamily: 'Oxygen',
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Quantity: $buyingQuantity',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Oxygen',
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
