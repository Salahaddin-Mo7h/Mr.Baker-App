import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:mr.baker_application/Auth/sign_in_page.dart';
import 'package:mr.baker_application/screens/cart_items_page/cart_items.dart';
import 'package:mr.baker_application/screens/home_page/home_page.dart';
import 'package:mr.baker_application/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:mr.baker_application/widgets/circuleIndicator.dart';

import '../widgets/customSnakeBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedPage = 0;
  final List _pages = [
    const HomePage(),
    const CartPage(),
    const ProfileScreen(),
  ];
  onTap(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.idTokenChanges(),
        builder: (context, snapshot) {
          // if user start the app
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return _pages[selectedPage];
            } else if (snapshot.hasError) {
              return showSnakeBar(snapshot.error.toString(), context);
            }
          }
//if the state is waiting so we have to show the circular progressive indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircleIndicator());
          }
          return Signin();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.orange),
          unselectedIconTheme: const IconThemeData(color: Color(0xffD0D1D7)),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          onTap: onTap,
          currentIndex: selectedPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: "",
            ),
          ]),
    );
  }
}
