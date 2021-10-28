import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/themes.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.18),
              child: Image.asset(
                'assets/image_onboarding.png',
                width: 280,
                height: 280,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 64),
              child: Text(
                '#AyoVaksin',
                style: blackTextStyle.copyWith(
                  fontSize: 28,
                  fontWeight: bold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Text(
                'Lindungi diri dan sekitar dengan\nberpartisipasi dalam program Vaksinasi\nCOVID-19',
                style: blackTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              height: 64,
              width: double.infinity,
              child: TextButton(
                child: Text(
                  'Mulai Sekarang',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
