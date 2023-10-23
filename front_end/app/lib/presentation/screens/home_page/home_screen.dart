import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:app/assistant/global.dart';
import 'package:app/presentation/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../categories.dart';
import 'home_screen_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  List<Widget> pages = [
    HomeScreenContent(),
    Categories(
      text: "page2",
    ),
    Categories(
      text: "page3",
    ),
    Categories(
      text: "page4",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: SafeArea(
        child: SizedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_trip');
            },
            // ignore: prefer_const_constructors, sort_child_properties_last
            child: Icon(
              Icons.add,
              size: 20,
            ),
            backgroundColor: kPrimaryColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 20,
          image: AssetImage("assets/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      CupertinoIcons.home,
      Icons.category,
      Icons.settings,
      CupertinoIcons.person,
    ];
    return AnimatedBottomNavigationBar(
        backgroundColor: kPrimaryColor,
        icons: iconItems,
        splashColor: kGrey,
        inactiveColor: Colors.white.withOpacity(0.5),
        gapLocation: GapLocation.center,
        activeIndex: pageIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        elevation: 2,
        onTap: (index) {
          setTabs(index);
        });
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
