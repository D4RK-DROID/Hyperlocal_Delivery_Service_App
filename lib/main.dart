import 'package:flutter/material.dart';
import 'package:hyperlocal_app/screens/category_screen.dart';
import 'package:hyperlocal_app/screens/home_screen.dart';
import 'package:hyperlocal_app/screens/login_screen.dart';
import 'package:hyperlocal_app/screens/shop_screen.dart';
import 'package:hyperlocal_app/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HyperLocal());
}

class HyperLocal extends StatelessWidget {
  const HyperLocal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        SignupScreen.id: (context) => const SignupScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        CategoryScreen.id: (context) => const CategoryScreen(),
        ShopScreen.id: (context) => const ShopScreen(),
      },
    );
  }
}
