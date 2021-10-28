import 'package:flutter/material.dart';
import 'package:go_vaccine/themes.dart';

class LoadingButton extends StatelessWidget {

  final Color bgColor;
  final Color color;
  final String text;
  final double marginTop;

  LoadingButton({this.text = 'Loading...', this.color = Colors.white, this.bgColor = Colors.white, this.marginTop = 72});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      margin: EdgeInsets.only(top: marginTop),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(color),
                strokeWidth: 2,
              )
            ),
            SizedBox(width: 8,),
            Text(
              text,
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}