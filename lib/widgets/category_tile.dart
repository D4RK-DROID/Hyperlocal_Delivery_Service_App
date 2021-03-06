import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:hyperlocal_app/screens/product_screen.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.categoryName,
    required this.imageURL,
  }) : super(key: key);

  final String categoryName;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(
                fieldName: 'category',
                fieldValue: categoryName,
                fromCategory: true,
              ),
            ));
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          color: kLightPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Image.network(
              imageURL,
              width: screenWidth * 0.42,
              height: 150,
            ),
            Text(
              categoryName,
              style: TextStyle(
                color: kDarkPurple,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
                fontFamily: 'Oxygen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
