import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/services/AuthService.dart';
import 'package:go_vaccine/themes.dart';
import 'package:go_vaccine/widgets/LoadingButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;
  bool isSigningIn = false;
  bool passwordInvisible = true;

  @override
  Widget build(BuildContext context) {

    saveSignedInUserEmail(String signedInEmail) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("current_email", signedInEmail);
    }

    showAlertSnackbar(String text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            text
          )
        ),
      );
    }

    handleLogin() async {
      if(emailController.text.isEmpty || passwordController.text.isEmpty) {
        showAlertSnackbar('Email & password tidak boleh kosong!');
        return;
      }

      setState(() {
        isLoading = true;
      });

      try {
        UserCredential userCredential =
        await AuthService().signInWithEmailAndPassword(emailController.text, passwordController.text);
        saveSignedInUserEmail(emailController.text);
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (Route<dynamic> route) => false,
          arguments: userCredential.user!.email
        );
      } catch(e) {
        print(e.toString());
        showAlertSnackbar('Email/password salah');
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Selamat Datang!',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: medium
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget subtitle() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(
          'Silahkan masuk menggunakan akunmu!',
          style: subtitleTextStyle.copyWith(
            fontSize: 12,
            fontWeight: light
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget email() {
      return Container(
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.only(top: 64),
        height: 64,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: blackTextStyle,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Email',
                    hintStyle: subtitleTextStyle
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget password() {
      return Container(
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.only(top: 12),
        height: 64,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: passwordController,
                  obscureText: passwordInvisible,
                  style: blackTextStyle,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Password',
                    hintStyle: subtitleTextStyle
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    passwordInvisible = !passwordInvisible;
                  });
                },
                child: Icon(
                  !passwordInvisible
                      ? Icons.visibility_off_sharp
                      : Icons.visibility_sharp,
                  color: subtitleTextColor,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget forgotPassword() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/forgot-password');
          },
          child: Text(
            'Lupa Password?',
            style: subtitleTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium
            ),
          ),
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 64,
        width: double.infinity,
        margin: EdgeInsets.only(top: 72),
        child: TextButton(
          onPressed: handleLogin,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24)
            )
          ),
          child: Text(
            'Masuk',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium
            ),
          ),
        ),
      );
    }

    Widget googleSignInButton() {
      return Container(
        height: 64,
        width: double.infinity,
        margin: EdgeInsets.only(top: 12),
        child: TextButton(
          onPressed: () async {
            setState(() {
              isSigningIn = true;
            });

            try {
              String? currentEmail = await AuthService().signInWithGoogle();
              saveSignedInUserEmail(currentEmail ?? '');
              Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
            } catch(e){
              if(e is FirebaseAuthException){
                showAlertSnackbar(e.message!);
              }
            }

            setState(() {
              isSigningIn = false;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: grey,
                width: 2
              ),
              borderRadius: BorderRadius.circular(24)
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 12),
                child: Image.asset(
                  'assets/icon_google.png',
                  width: 24,
                ),
              ),
              Text(
                'Masuk dengan Google',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget signUpText() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum punya akun? ',
              style: blackTextStyle,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'Daftar',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 14
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
          child: ListView(
            children: [
              title(),
              subtitle(),
              email(),
              password(),
              forgotPassword(),
              isLoading ? LoadingButton(bgColor: primaryColor) : signInButton(),
              isSigningIn
                  ? LoadingButton(text: '', color: Colors.orange, bgColor: white, marginTop: 12,)
                  : googleSignInButton(),
              signUpText()
            ],
          ),
        ),
      ),
    );
  }
}