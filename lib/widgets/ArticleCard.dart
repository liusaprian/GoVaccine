import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_vaccine/themes.dart';

class ArticleCard extends StatelessWidget {

  final bool marginRight;
  ArticleCard({this.marginRight = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        margin: marginRight == true
            ? EdgeInsets.only(right: 20)
            : EdgeInsets.only(right: 0),
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://akcdn.detik.net.id/community/media/visual/2021/09/27/harapan-baru-di-tengah-rendahnya-kasus-positif-covid-19-jakarta-7_169.jpeg',
                fit: BoxFit.cover,
              ),
              Container(
                color: textBackground,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Text(
                        'DKI Tertinggi 140 Kasus, Ini Sebaran 894 Kasus Baru COVID-19 RI 10 Oktober',
                        style: whiteTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: semiBold
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQYUlzGlthJCY-hpPgD5hturLbuxZBYd0TPQ&usqp=CAU'
                            ),
                          ),
                          SizedBox(width: 12,),
                          Text(
                            'Lius Aprian',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
