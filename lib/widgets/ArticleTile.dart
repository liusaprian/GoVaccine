import 'package:flutter/material.dart';
import 'package:go_vaccine/themes.dart';

class ArticleTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/article-detail');
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        margin: EdgeInsets.only(top: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://akcdn.detik.net.id/community/media/visual/2021/09/27/harapan-baru-di-tengah-rendahnya-kasus-positif-covid-19-jakarta-7_169.jpeg',
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DKI Tertinggi 140 Kasus, Ini Sebaran 894 Kasus Baru COVID-19 RI 10 Oktober',
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(height: 4,),
                    Text(
                      'Sept 26, 2021 • 13:41',
                      style: subtitleTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
