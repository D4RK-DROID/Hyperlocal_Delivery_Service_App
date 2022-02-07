import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    Key? key,
    required this.assetName,
    required this.categoryName,
    this.imageWidth,
    this.imageHeight,
    this.fontSize,
  }) : super(key: key);
  final String assetName;
  final String categoryName;
  final double? imageWidth;
  final double? imageHeight;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kLightPurple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage(assetName),
            width: imageWidth ?? 170,
            height: imageHeight ?? 150,
          ),
          Text(
            categoryName,
            style: TextStyle(
              color: kDarkPurple,
              fontSize: fontSize ?? 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oxygen',
            ),
          ),
        ],
      ),
    );
  }
}
