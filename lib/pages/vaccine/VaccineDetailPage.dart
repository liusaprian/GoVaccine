import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/models/VaccineModel.dart';
import 'package:go_vaccine/themes.dart';
import 'package:go_vaccine/widgets/CircleProgress.dart';
import 'package:go_vaccine/widgets/ColoredCircle.dart';
import 'package:go_vaccine/widgets/RelatedArticleCard.dart';

class VaccineDetailPage extends StatelessWidget {
  late final VaccineModel vaccine;
  VaccineDetailPage({required this.vaccine});

  @override
  Widget build(BuildContext context) {

    Widget backBtn() {
      return Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios , color: primaryColor,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            'Kembali',
            style: blackTextStyle,
          )
        ],
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(
          vaccine.name,
          style: blackTextStyle.copyWith(
            fontSize: 28,
            fontWeight: bold
          ),
        ),
      );
    }

    Widget image() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        child: Image.network(
          vaccine.imageUrl,
          fit: BoxFit.cover,
        ),
      );
    }

    Widget information() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Container(
              child: Row(
                children: [
                  CustomPaint(
                    foregroundPainter: CircleProgress(vaccine.efficacy.toDouble()),
                    child: Container(
                      width: 70,
                      height: 70,
                      child: Center(
                        child: Text(
                          '${vaccine.efficacy}%',
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                  Text(
                    'Efektif dalam\npengujian klinis\nsecara massal',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 24,),
            Flexible(
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomPaint(
                      foregroundPainter: CircleProgress(100.0),
                      child: Container(
                        width: 70,
                        height: 70,
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: primaryColor,
                            size: 32,
                          )
                        ),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Flexible(
                      child: Text(
                        vaccine.permissions,
                        softWrap: true,
                        maxLines: 3,
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: light
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold
              ),
            ),
            SizedBox(height: 8,),
            Text(
              vaccine.desc,
              softWrap: true,
              style: blackTextStyle.copyWith(
                fontWeight: light
              ),
            )
          ],
        ),
      );
    }

    Widget sideEffects() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Efek Samping',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold
              ),
            ),
            SizedBox(height: 4,),
            Column(
              children: vaccine.sideEffects.map((sideEffect) {
                return Container(
                  margin: EdgeInsets.only(top: 8, left: 4),
                  child: Row(
                    children: [
                      ColoredCircle(color: black,),
                      SizedBox(width: 16,),
                      Text(
                        sideEffect,
                        style: blackTextStyle.copyWith(fontWeight: light),
                        softWrap: true,
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      );
    }

    Widget relatedArticlesTitle() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Text(
          'Artikel Terkait',
          style: blackTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16
          ),
        ),
      );
    }
    
    Widget relatedArticles() {
      return Container(
        height: 108,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            if(index != 1) return RelatedArticleCard(marginRight: 16,);
            return RelatedArticleCard(marginRight: 0);
          },
        )
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 25),
          child: ListView(
            children: [
              backBtn(),
              title(),
              image(),
              information(),
              description(),
              sideEffects(),
              relatedArticlesTitle(),
              relatedArticles()
            ],
          ),
        ),
      ),
    );
  }
}
