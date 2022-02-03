import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  void getName() async {
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
    getName();
  }

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
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username != null ? 'Hi $username 👋' : 'Hi name 👋',
                          style: const TextStyle(
                            fontSize: 22,
                            fontFamily: 'Lora',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lora',
                          ),
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
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: kDarkPurple,
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: kDarkPurple,
                        fontFamily: 'Oxygen',
                      ),
                      fillColor: const Color(0xFFFFFFFF),
                    ),
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
                            onPressed: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: kPurple,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: const [
                                  Image(
                                    width: 200,
                                    image:
                                        AssetImage('images/nearby_store.png'),
                                  ),
                                  Text(
                                    'Nearby Stores',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Oxygen',
                                      fontSize: 16,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  SizedBox(
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
                        onPressed: () {},
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
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0xFF5C5470),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Color(0xFF5C5470),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              backgroundColor: Color(0xFF5C5470),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
              backgroundColor: Color(0xFF5C5470),
            )
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}

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
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
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
    );
  }
}
