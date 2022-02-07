import 'package:flutter/material.dart';
import 'package:hyperlocal_app/constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: kMidPurple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: kMidPurple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
          backgroundColor: kMidPurple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
          backgroundColor: kMidPurple,
        )
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    );
  }
}

class NewNavBar extends StatelessWidget {
  const NewNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: kMidPurple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.menu_outlined,
                color: Colors.white,
                size: 25,
              )),
        ],
      ),
    );
  }
}
