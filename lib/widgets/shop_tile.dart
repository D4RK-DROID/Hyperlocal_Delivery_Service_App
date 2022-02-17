import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:hyperlocal_app/screens/product_screen.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(
                fieldName: 'store',
                fieldValue: storeName,
                fromCategory: false,
              ),
            ));
      },
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Image(
                  image: const AssetImage('images/shop.png'),
                  width: screenWidth * 0.37,
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
                            color: kWhite,
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
                            color: kWhite,
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
                              color: kWhite,
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
                              color: kWhite,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: kWhite,
                            ),
                            width: screenWidth * 0.3,
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
                fontWeight: FontWeight.w700,
                color: kWhite,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: kPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.only(bottom: 25),
      ),
    );
  }
}
