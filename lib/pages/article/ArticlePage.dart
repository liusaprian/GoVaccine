import 'package:flutter/material.dart';
import 'package:go_vaccine/themes.dart';
import 'package:go_vaccine/widgets/ArticleCard.dart';
import 'package:go_vaccine/widgets/ArticleTile.dart';

class ArticlePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        child: Text(
          'COVID-19 Articles',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold
          ),
        ),
      );
    }

    Widget popularHeader() {
      return Container(
        margin: EdgeInsets.only(top: 32),
        child: Text(
          'Popular',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold
          ),
        )
      );
    }

    Widget articleCards() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            if(index == 2) return ArticleCard(marginRight: false,);
            return ArticleCard();
          },
        ),
      );
    }

    Widget recentHeader() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent',
              style: blackTextStyle.copyWith(
                fontSize: 28,
                fontWeight: semiBold
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
              onPressed: () {
              },
              child: Text(
                'Lihat Semua',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium
                ),
              ),
            ),
          ],
        )
      );
    }

    Widget articleTiles() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.infinity,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ArticleTile();
          },
          itemCount: 5,
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 24, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              popularHeader(),
              articleCards(),
              recentHeader(),
              articleTiles()
            ],
          ),
        ),
      ),
    );
  }
}
