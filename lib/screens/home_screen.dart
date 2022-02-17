import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hyperlocal_app/screens/shop_screen.dart';
import 'package:hyperlocal_app/widgets/custom_tile.dart';
import 'package:hyperlocal_app/widgets/navbar.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;
  final _auth = FirebaseAuth.instance;
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Future getName() async {
    dynamic data = await _firestore
        .collection('users')
        .where('email', isEqualTo: loggedInUser.email)
        .get();
    for (var docs in data.docs) {
      username = await docs['name'];
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
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
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                          future: getName(),
                          builder: (context, name) {
                            return Text(
                              'Hi $username 👋',
                              style: const TextStyle(
                                fontSize: 22,
                                fontFamily: 'Lora',
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        const Text(
                          'Welcome back!',
                          style: kHeadingTextStyle,
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundColor: Color(0xFFFFFFFF),
                    )
                  ],
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
                    decoration: kSearchFieldDecoration,
                    style: const TextStyle(
                      color: kDarkPurple,
                      fontFamily: 'Oxygen',
                    ),
                    cursorColor: kDarkPurple,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, ShopScreen.id);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: kPurple,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Image(
                                    width: screenWidth * 0.5,
                                    image: const AssetImage(
                                        'images/nearby_store.png'),
                                  ),
                                  const Text(
                                    'Nearby Stores',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Oxygen',
                                      fontSize: 16,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Flexible(
                            child: Text(
                              'Shop from the stores near you',
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontSize: 34,
                                fontFamily: 'Oxygen',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, CategoryScreen.id);
                          });
                        },
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Container(
                          height: 42,
                          decoration: BoxDecoration(
                            color: kPurple,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text(
                              'Shop by category',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Oxygen',
                                color: kWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Popular Categories',
                        style: TextStyle(
                          fontFamily: 'Oxygen',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CustomTile(
                              assetName: 'images/grocery.png',
                              categoryName: 'General',
                            ),
                            SizedBox(width: 10),
                            CustomTile(
                              assetName: 'images/vegetables.png',
                              categoryName: 'Vegetables',
                            ),
                            SizedBox(width: 10),
                            CustomTile(
                              assetName: 'images/fruit_basket.png',
                              categoryName: 'Fruits',
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Top Picks For You',
                        style: TextStyle(
                          fontFamily: 'Oxygen',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CustomTile(
                              assetName: 'images/onion.png',
                              categoryName: 'Onion-1kg',
                            ),
                            SizedBox(width: 10),
                            CustomTile(
                              assetName: 'images/amul_milk.png',
                              categoryName: 'Milk-500ml',
                            ),
                            SizedBox(width: 10),
                            CustomTile(
                              assetName: 'images/lays.png',
                              categoryName: 'Lays-52gm',
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NewNavBar(),
      ),
    );
  }
}
