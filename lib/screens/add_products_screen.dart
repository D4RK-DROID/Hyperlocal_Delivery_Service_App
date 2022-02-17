import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  static const String id = 'AddProductsScreen';
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<String> categoryList = [];
    Future getCategories() async {
      final categories = await _firestore.collection('categories').get();
      for (var i = 0; i < categories.docs.length; i++) {
        String categoryName = categories.docs[i]['category'];
        categoryList.add(categoryName);
      }
    }

    List<String> shopList = [];
    Future getStores() async {
      final shops = await _firestore.collection('shops').get();
      for (var i = 0; i < shops.docs.length; i++) {
        String shopName = shops.docs[i]['name'];
        shopList.add(shopName);
      }
    }

    return Theme(
      data: ThemeData.dark(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kDarkPurple,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  const Text(
                    "Add Products",
                    style: kHeadingTextStyle,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(
                      right: screenWidth * 0.05,
                      left: screenWidth * 0.05,
                      bottom: 20,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                              primary: kDarkPurple,
                            ),
                      ),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Product Name",
                          fillColor: const Color(0xFFFFFFFF),
                          prefixIcon: const Icon(Icons.filter_none),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        cursorColor: kDarkPurple,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kWhite,
                      border: Border.all(
                        color: kWhite,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      right: screenWidth * 0.05,
                      left: screenWidth * 0.05,
                      bottom: 20,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                              primary: kDarkPurple,
                            ),
                      ),
                      child: FutureBuilder(
                        future: getCategories(),
                        builder: (context, snapshot) {
                          Object? categoryName;
                          return DropdownButton(
                            style: const TextStyle(
                              color: kWhite,
                            ),
                            value: categoryName,
                            items: categoryList.map((String value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            borderRadius: BorderRadius.circular(15),
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            hint: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(Icons.category_outlined),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  categoryName == null
                                      ? "Product Category"
                                      : categoryName.toString(),
                                  style: const TextStyle(
                                    fontFamily: 'Oxygen',
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            iconSize: 36,
                            onChanged: (value) {
                              setState(() {
                                categoryName = value!;
                              });
                            },
                            dropdownColor: kPurple,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kWhite,
                      border: Border.all(
                        color: kWhite,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      right: screenWidth * 0.05,
                      left: screenWidth * 0.05,
                      bottom: 20,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                              primary: kDarkPurple,
                              secondary: kWhite,
                            ),
                      ),
                      child: FutureBuilder(
                        future: getStores(),
                        builder: (context, shops) {
                          Object? shopName;
                          return DropdownButton(
                            style: const TextStyle(
                              color: kWhite,
                            ),
                            value: shopName,
                            items: shopList.map((String value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            iconSize: 36,
                            borderRadius: BorderRadius.circular(15),
                            isExpanded: true,
                            underline: Container(
                              height: 0,
                            ),
                            hint: Row(
                              children: const [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.store),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Store Name",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Oxygen',
                                  ),
                                ),
                              ],
                            ),
                            onChanged: (value) {
                              setState(() {
                                shopName = value!;
                              });
                            },
                            dropdownColor: kPurple,
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: screenWidth * 0.05,
                      left: screenWidth * 0.05,
                      bottom: 20,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                              primary: kDarkPurple,
                            ),
                      ),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Product Quantity",
                          fillColor: const Color(0xFFFFFFFF),
                          prefixIcon: const Icon(
                              Icons.production_quantity_limits_outlined),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        cursorColor: kDarkPurple,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: screenWidth * 0.05,
                      left: screenWidth * 0.05,
                      bottom: 20,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                              primary: kDarkPurple,
                            ),
                      ),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Product Packaging",
                          fillColor: const Color(0xFFFFFFFF),
                          prefixIcon: const Icon(Icons.backpack_outlined),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        cursorColor: kDarkPurple,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: screenWidth * 0.05,
                      left: screenWidth * 0.05,
                      bottom: 20,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                              primary: kDarkPurple,
                            ),
                      ),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Product Price",
                          fillColor: const Color(0xFFFFFFFF),
                          prefixIcon:
                              const Icon(Icons.monetization_on_outlined),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        cursorColor: kDarkPurple,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: screenWidth * 0.05,
                      left: screenWidth * 0.05,
                      bottom: 20,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                              primary: kDarkPurple,
                            ),
                      ),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Product Rating",
                          fillColor: const Color(0xFFFFFFFF),
                          prefixIcon: const Icon(Icons.reviews_outlined),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        cursorColor: kDarkPurple,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: screenWidth * 0.05,
                      left: screenWidth * 0.05,
                      bottom: 20,
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                              primary: kDarkPurple,
                            ),
                      ),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: "Product Stock",
                          fillColor: const Color(0xFFFFFFFF),
                          prefixIcon: const Icon(Icons.stacked_bar_chart),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.0,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        cursorColor: kDarkPurple,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: kWhite,
                          width: 2.0,
                        )),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Add Product",
                        style: TextStyle(
                          color: kWhite,
                          fontFamily: "Oxygen",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
