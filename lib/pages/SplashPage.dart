import 'package:flutter/material.dart';
import 'package:go_vaccine/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    final prefs = await SharedPreferences.getInstance();
    String signedInUserEmail = (prefs.getString("current_email") ?? '');
    if(signedInUserEmail != '') Navigator.popAndPushNamed(context, '/home');
    else Navigator.popAndPushNamed(context, '/on-boarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/app_logo.png')
            )
          ),
        ),
      ),
    );
  }
}