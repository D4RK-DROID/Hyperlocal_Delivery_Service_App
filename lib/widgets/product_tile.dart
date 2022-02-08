import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.productName,
    required this.productQuantity,
    required this.productPackaging,
    required this.productPrice,
    required this.storeName,
    required this.productRating,
  }) : super(key: key);

  final String productName;
  final String productQuantity;
  final String productPackaging;
  final int productPrice;
  final String storeName;
  final int productRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kPurple,
      ),
      child: Row(
        children: [
          Container(
            child: const Image(
              image: AssetImage('images/nescafe_iced_latte.png'),
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
                '₹$productPrice/180ml',
                style: const TextStyle(
                  fontFamily: 'Oxygen',
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    size: 16,
                    color: kYellow,
                  ),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: kYellow,
                  ),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: kYellow,
                  ),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: kYellow,
                  ),
                  Icon(
                    Icons.star_border,
                    size: 16,
                    color: kYellow,
                  ),
                ],
              ),
              Text(
                'Sold by: $storeName',
                style: const TextStyle(
                  fontFamily: 'Oxygen',
                ),
              ),
              TextButton(
                onPressed: () {},
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
    );
  }
}
