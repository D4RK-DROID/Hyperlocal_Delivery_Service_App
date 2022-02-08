import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:hyperlocal_app/widgets/navbar.dart';
import 'package:hyperlocal_app/widgets/product_stream.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.categoryName}) : super(key: key);
  static const String id = 'ProductScreen';
  final String categoryName;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: kDarkPurple,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.arrow_back,
                      color: kWhite,
                    ),
                  ),
                ),
                const Text(
                  'Beverages',
                  style: kHeadingTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ThemeData().colorScheme.copyWith(
                          primary: kDarkPurple,
                        ),
                  ),
                  child: TextField(
                    decoration: kSearchFieldDecoration.copyWith(
                        hintText: 'Search Beverages'),
                    style: const TextStyle(
                      color: kDarkPurple,
                      fontFamily: 'Oxygen',
                    ),
                    cursorColor: kDarkPurple,
                  ),
                ),
                const SizedBox(height: 20),
                ProductStream(
                  categoryName: widget.categoryName,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NewNavBar(),
      ),
    );
  }
}
