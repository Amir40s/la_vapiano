// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:la_vapiano/screen/ask_language/select_language_screen.dart';
// import 'package:la_vapiano/screen/item_menu_screen/items_menu_screen.dart';
// import 'package:la_vapiano/utils/constants.dart';
//
// import '../about/about_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   int _currentIndex = 0;
//
//   final screens = [
//     SelectLanguageScreen(),
//     AboutScreen(),
//     ItemsMenuScreen()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: primaryColor,
//         unselectedItemColor: Colors.grey,
//         selectedItemColor: secondaryColor,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index; // Update the current index
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//             backgroundColor: secondaryColor
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.info),
//             label: "About",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: "Menu",
//           ),
//         ],
//       ),
//       body: screens[_currentIndex],
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vapiano/screen/food_history/food_history_screen.dart';
import 'package:la_vapiano/screen/home/provider/bottom_nav_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../about/about_screen.dart';
import '../food_menu_screen/food_menu_screen.dart';
import '../item_menu_screen/items_menu_screen.dart';

class HomeScreen extends StatelessWidget {

  final String menuName;
   HomeScreen({super.key, required this.menuName});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);

    final List<Widget> screens = [
      //ItemsMenuScreen (),
      FoodMenuScreen(menuName: menuName,),
      AboutScreen(),
     FoodHistoryScreen()
     //  ItemsMenuScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.updateIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "About",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
        ],
      ),
      body: screens[provider.currentIndex],
    );
  }
}

