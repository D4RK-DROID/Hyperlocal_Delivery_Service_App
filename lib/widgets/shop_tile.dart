import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';

class ShopTile extends StatelessWidget {
  const ShopTile({
    Key? key,
    required this.address,
    required this.category,
    required this.storeName,
    required this.storeRating,
  }) : super(key: key);

  final String address;
  final String category;
  final String storeName;
  final int storeRating;
  @override
  Widget build(BuildContext context) {
    List<Widget> review = [];
    for (var i = 0; i < storeRating; i++) {
      Icon reviewIcon = const Icon(
        Icons.star,
        size: 20,
        color: kYellow,
      );
      review.add(reviewIcon);
    }
    for (var i = 0; i < 5 - storeRating; i++) {
      Icon reviewIcon = const Icon(
        Icons.star_outline,
        size: 20,
        color: kYellow,
      );
      review.add(reviewIcon);
    }
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              const Image(
                image: AssetImage('images/shop.png'),
                width: 155,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Add: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(text: address),
                        ],
                        style: const TextStyle(
                          fontFamily: 'Oxygen',
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Category: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          TextSpan(text: category),
                        ],
                        style: const TextStyle(
                          fontFamily: 'Oxygen',
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Review:',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Oxygen',
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Row(
                          children: review,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Offer \nDetails:',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Oxygen',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kWhite,
                          ),
                          width: 100,
                          height: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              )
            ],
          ),
          Text(
            storeName,
            style: const TextStyle(
                fontSize: 28,
                fontFamily: 'Oxygen',
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
        ],
      ),
      decoration: BoxDecoration(
        color: kPurple,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(bottom: 25),
    );
  }
}
