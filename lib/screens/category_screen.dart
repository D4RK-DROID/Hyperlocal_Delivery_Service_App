import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:hyperlocal_app/widgets/category_tile.dart';
import 'package:hyperlocal_app/widgets/navbar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  static const String id = 'CategoryScreen';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                  'Categories',
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
                        hintText: 'Search Category'),
                    style: const TextStyle(
                      color: kDarkPurple,
                      fontFamily: 'Oxygen',
                    ),
                    cursorColor: kDarkPurple,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTile(
                            assetName: 'images/bakery_items.png',
                            categoryName: 'Bakery',
                          ),
                          CustomTile(
                            assetName: 'images/bakery_items.png',
                            categoryName: 'Bakery',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTile(
                            assetName: 'images/bakery_items.png',
                            categoryName: 'Bakery',
                          ),
                          CustomTile(
                            assetName: 'images/bakery_items.png',
                            categoryName: 'Bakery',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTile(
                            assetName: 'images/bakery_items.png',
                            categoryName: 'Bakery',
                          ),
                          CustomTile(
                            assetName: 'images/bakery_items.png',
                            categoryName: 'Bakery',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTile(
                            assetName: 'images/bakery_items.png',
                            categoryName: 'Bakery',
                          ),
                          CustomTile(
                            assetName: 'images/bakery_items.png',
                            categoryName: 'Bakery',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
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
