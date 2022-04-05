import 'package:budgetio/BottomNavBar/AddingPage.dart';
import 'package:budgetio/BottomNavBar/AlertPage.dart';
import 'package:budgetio/BottomNavBar/CartPage.dart';
import 'package:budgetio/BottomNavBar/StatisticPage.dart';
import 'package:flutter/material.dart';
import 'package:budgetio/main.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';


import '../DrawerClass.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex =0;
  final List<dynamic> screens = [
    AddingPage(),
    StatisticPage(),
    CartPage(),
    AlertPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budgetio'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
       child: screens[_selectedIndex],
      ),
      drawer: DrawerClass(),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home,
          Icons.query_stats,
          Icons.shopping_bag,
          Icons.doorbell,
        ],

        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
        onTap: _onItemTapped,

      ),





    );}}
