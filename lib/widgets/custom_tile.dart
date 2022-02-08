import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:hyperlocal_app/screens/product_screen.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    Key? key,
    required this.assetName,
    required this.categoryName,
  }) : super(key: key);
  final String assetName;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, ProductScreen.id);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kLightPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Image(
              image: AssetImage(assetName),
              width: 120,
              height: 100,
            ),
            Text(
              categoryName,
              style: const TextStyle(
                color: kDarkPurple,
                fontSize: 14,
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
