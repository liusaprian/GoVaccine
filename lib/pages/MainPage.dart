import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/pages/article/ArticlePage.dart';
import 'package:go_vaccine/pages/home/HomePage.dart';
import 'package:go_vaccine/pages/location/LocationPage.dart';
import 'package:go_vaccine/pages/profile/ProfilePage.dart';
import 'package:go_vaccine/themes.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget body() {
      switch(currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return LocationPage();
        case 2:
          return ArticlePage();
        case 3:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: body(),
      ),
      bottomNavigationBar: DotNavigationBar(
        boxShadow: [
          BoxShadow(
            color: subtitleTextColor,
            blurRadius: 4,
            offset: Offset(0, 3),
          )
        ],
        currentIndex: currentIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: black,
        backgroundColor: white,
        marginR: EdgeInsets.all(24),
        paddingR: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        borderRadius: 40,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        enableFloatingNavBar: true,
        items: [
          DotNavigationBarItem(icon: Icon(Icons.home)),
          DotNavigationBarItem(icon: Icon(Icons.location_on_sharp)),
          DotNavigationBarItem(icon: Icon(Icons.article_sharp)),
          DotNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
