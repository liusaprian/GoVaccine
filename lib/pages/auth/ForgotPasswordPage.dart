import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/services/AuthService.dart';
import 'package:go_vaccine/themes.dart';

class ForgotPasswordPage extends StatefulWidget {

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'Reset Password',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  'Masukkan email yang terasosiasi dengan akunmu\ndan kami akan mengirimkan email berisi instruksi\nuntuk reset passwordmu.',
                  style: subtitleTextStyle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text(
                  'Alamat email',
                  style: subtitleTextStyle,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey,
                    width: 2
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.only(top: 8),
                height: 54,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: TextFormField(
                    controller: emailController,
                    style: blackTextStyle,
                    decoration: InputDecoration.collapsed(
                        hintText: 'abc@cde.com',
                        hintStyle: subtitleTextStyle
                    ),
                  ),
                ),
              ),
              Container(
                height: 54,
                width: double.infinity,
                margin: EdgeInsets.only(top: 12),
                child: TextButton(
                  onPressed: () async {
                    AuthService service = AuthService();
                    await service.resetPassword(emailController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: primaryColor,
                        content: Text(
                          'Instruksi terkirim'
                        )
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  child: Text(
                    'Kirim Instruksi',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
