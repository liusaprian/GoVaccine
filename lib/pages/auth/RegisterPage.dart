import 'package:flutter/material.dart';
import 'package:go_vaccine/models/UserModel.dart';
import 'package:go_vaccine/services/AuthService.dart';
import 'package:go_vaccine/themes.dart';
import 'package:go_vaccine/widgets/LoadingButton.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController fullNameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool passwordInvisible = true;

  @override
  Widget build(BuildContext context) {

    handleRegister() async {
      setState(() {
        isLoading = true;
      });

      UserModel user = UserModel(
          fullName: fullNameController.text,
          email: emailController.text,
          phoneNumber: phoneNumberController.text,
          password: passwordController.text
      );

      AuthService service = AuthService();
      await service.signUpWithEmailAndPassword(context, user);

      setState(() {
        isLoading = false;
      });
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Buat akun baru!',
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
          'Silahkan isi form dibawah untuk melanjutkan',
          style: subtitleTextStyle.copyWith(
              fontSize: 12,
              fontWeight: light
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget fullName() {
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
                  controller: fullNameController,
                  validator: (value) {
                    if(value == null || value.length < 5) {
                      return 'Nama harus memiliki lebih dari 5 karakter!';
                    }
                    return null;
                  },
                  style: blackTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Nama Lengkap',
                      hintStyle: subtitleTextStyle
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget email() {
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if(value == null || !value.contains('@') || !value.endsWith('.com')) {
                      return 'Format email tidak valid!';
                    }
                    return null;
                  },
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

    Widget phoneNumber() {
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
              Container(
                margin: EdgeInsets.only(right: 4),
                child: Text(
                  '+62',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Nomor telepon tidak boleh kosong!';
                    }
                    return null;
                  },
                  style: blackTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Nomor Telepon',
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
                  validator: (value) {
                    if(value == null || value.length < 8) {
                      return 'Password harus memiliki minimal 8 karakter';
                    }
                    return null;
                  },
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

    Widget signUpButton() {
      return Container(
        height: 64,
        width: double.infinity,
        margin: EdgeInsets.only(top: 72),
        child: TextButton(
          onPressed: () {
            if(formKey.currentState!.validate())
              handleRegister();
          },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)
              )
          ),
          child: Text(
            'Daftar',
            style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium
            ),
          ),
        ),
      );
    }

    Widget signInText() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah punya akun? ',
              style: blackTextStyle,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Masuk',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                title(),
                subtitle(),
                fullName(),
                email(),
                phoneNumber(),
                password(),
                isLoading ? LoadingButton(bgColor: primaryColor) : signUpButton(),
                signInText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}