import 'package:flutter/material.dart';
import 'package:go_vaccine/themes.dart';

class RelatedArticleCard extends StatelessWidget {
  final double marginRight;
  RelatedArticleCard({required this.marginRight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: subtitleTextColor,
              blurRadius: 2,
              offset: Offset(0, 2),
            )
          ]
        ),
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 12, bottom: 4, right: marginRight),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Guardian',
                    style: blackTextStyle,
                  ),
                  SizedBox(height: 4,),
                  Text(
                    'Penelitian, efektivitas vaksin Covid-19 Pfizer turun lebih cepat dari Astrazeneca',
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                    ),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://foto.kontan.co.id/ssL3TIGdiaYncmFQWaLk5rnEr68=/smart/2021/09/26/1218867418p.jpg',
                  fit: BoxFit.cover,
                  width: 72,
                  height: 72,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
