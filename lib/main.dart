import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_vaccine/pages/MainPage.dart';
import 'package:go_vaccine/pages/article/ArticleDetailPage.dart';
import 'package:go_vaccine/pages/auth/ForgotPasswordPage.dart';
import 'package:go_vaccine/pages/auth/LoginPage.dart';
import 'package:go_vaccine/pages/OnBoardingPage.dart';
import 'package:go_vaccine/pages/SplashPage.dart';
import 'package:go_vaccine/pages/auth/RegisterPage.dart';
import 'package:go_vaccine/pages/profile/CameraPage.dart';
import 'package:go_vaccine/pages/profile/EditProfilePage.dart';
import 'package:go_vaccine/pages/search/SearchPage.dart';
import 'package:go_vaccine/pages/vaccineregistration/VaccineRegistrationHistoryPage.dart';
import 'package:go_vaccine/pages/vaccineregistration/VaccineRegistrationProfilePage.dart';
import 'package:go_vaccine/themes.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: primaryColor
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/on-boarding': (context) => OnBoardingPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/forgot-password': (context) => ForgotPasswordPage(),
        '/home': (context) => MainPage(),
        '/search': (context) => SearchPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/camera': (context) => CameraPage(),
        '/article-detail': (context) => ArticleDetailPage(),
        '/vaccine-registration-profile': (context) => VaccineRegistrationProfilePage(),
        '/vaccine-registration-history': (context) => VaccineRegistrationHistoryPage(),
      },
    );
  }
}