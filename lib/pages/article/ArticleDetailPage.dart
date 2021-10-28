import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/themes.dart';
import 'package:simple_tags/simple_tags.dart';

class ArticleDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final List<String> tags = [
      'covid-19',
      'antibodi corona',
      'corona',
      'virus corona',
      'kekebalan alami'
    ];

    Widget header() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Stack(
          children: [
            Image.network(
              'https://akcdn.detik.net.id/community/media/visual/2020/09/05/ilustrasi-covid-19_169.jpeg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.fitHeight,
            ),
            Container(
              color: textBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Text(
                      'Sept 26, 2021 • 13:41',
                      style: whiteTextStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'Antibodi Vaksin Vs Infeksi COVID-19 Alami, Mana yang Lebih Tahan Lama?',
                      style: whiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold
                      ),
                      softWrap: true,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQYUlzGlthJCY-hpPgD5hturLbuxZBYd0TPQ&usqp=CAU'
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Maria Riades',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: semiBold
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                'Jurnalis Kompas',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                  fontWeight: light
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            ],
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget articleContent() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Text(
          'Jakarta - Salah satu cara yang disebut mampu mengatasi '
          'pandemi COVID-19 adalah dengan membentuk kekebalan '
          'kelompok atau herd immunity. Untuk mencapainya ada dua '
          'cara, yaitu dengan antibodi tubuh atau imunitas dari '
          'vaksin maupun infeksi COVID-19 alami.\n\nPara peneliti '
          'mengklaim bahwa vaksin COVID-19 yang ada saat ini '
          'menawarkan perlindungan yang lebih baik dibandingkan '
          'antibodi alami. Maka dari itu, banyak ahli yang '
          'menyarankan mereka yang pernah terinfeksi untuk tetap '
          'mendapatkan vaksin COVID-19.\n\nMenurut para ahli di '
          'King\'s College London dan perusahaan teknologi '
          'kesehatan ZOE, antibodi dari infeksi alami mampu '
          'menghentikan 65 persen terjadinya reinfeksi atau infeksi '
          'ulang. Sementara vaksin, seperti AstraZeneca memberikan '
          'antibodi sekitar 71 persen dan Pfizer 80 persen setelah '
          'enam bulan.\n\nMeski keduanya memiliki kemampuan yang baik '
          'dalam melindungi tubuh dari virus Corona, tetapi sulit '
          'untuk mengetahui perlindungan mana yang terbaik. Dari '
          'jutaan orang yang terinfeksi COVID-19 tidak menguji seberapa '
          'besar antibodi yang mereka punya, sehingga sulit untuk '
          'menghitung perlindungannya secara akurat.\n\nSatu studi '
          'menemukan bahwa antibodi alami bisa menawarkan perlindungan '
          '3 kali lebih banyak dari infeksi dibandingkan dua dosis '
          'vaksin Pfizer. Tetapi, tim ZOE mengatakan mereka yang '
          'tertular COVID-19 dan divaksinasi memiliki pertahanan '
          'terkuat untuk melawan virus Corona.\n\n\"Orang yang '
          'tertular COVID-19 kemudian divaksinasi kemungkinan akan '
          'mempertahankan tingkat perlindungan yang lebih tinggi,\" '
          'tulis peneliti yang dikutip dari Daily Mail, Senin '
          '(11/10/2021).\n\nProfesor Tim Spector mengatakan ini '
          'adalah kabar yang sangat positif untuk meningkatkan antibodi '
          'yang efektif dan tahan lama dari COVID-19.\n\n\"Ini juga '
          'merupakan bukti kuat untuk mendukung perlunya vaksinasi, '
          'bahkan bagi mereka yang sudah terkena COVID-19,\" kata '
          'Spector.\n\nAhli imunologi di University of Reading Dr '
          'Alexander Edwards, mengatakan antibodi dari infeksi '
          'alami mungkin bisa melindungi diri. Tetapi, virus termasuk '
          'COVID-19 ini memiliki cara untuk bisa menghindar dari '
          'kekebalan. Untuk itu, vaksin COVID-19 masih sangat '
          'Qdibutuhkan.\n\n\"Di satu sisi, sistem kekebalan kita '
          'sangat brilian dalam menanggapi banyak infeksi yang berbeda. '
          'Namun, virus termasuk COVID-19 memiliki trik yang '
          'memungkinkan mereka menghindari kekebalan,\" jelasnya.'
          '\n\n\"Sebaliknya, vaksin dirancang murni untuk mempromosikan '
          'kekebalan yang kuat secara langsung terhadap target virus '
          'yang paling penting. Mereka (vaksin) memberikan perlindungan '
          'yang sangat baik,\" lanjut Dr Edwards.\n\nMenurut Dr Edwards, '
          'antibodi yang didapat setelah vaksinasi jauh lebih tinggi '
          'dibandingkan akibat infeksi alami. Sebab, vaksin mengandung '
          '\'antibodi penetral virus\' yang mengikat dan membersihkan '
          'virus di tubuh.\n\n\"Apa yang mereka lakukan adalah mengikat '
          'dan membersihkan virus, mencegahnya memasuki sel kita,\" pungkasnya.',
          style: blackTextStyle.copyWith(
            fontSize: 18
          ),
        ),
      );
    }

    Widget shareButtons() {
      return Container(
        margin: EdgeInsets.only(top: 4),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadiusDirectional.circular(100)
              ),
              margin: EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.facebook_rounded),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadiusDirectional.circular(100)
              ),
              margin: EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {

                },
                icon: Image.asset(
                  'assets/twitter.png',
                  width: 24,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadiusDirectional.circular(100)
              ),
              margin: EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.mail_rounded),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadiusDirectional.circular(100)
              ),
              margin: EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.share),
              ),
            ),
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        child: SimpleTags(
          content: tags,
          tagContainerPadding: EdgeInsets.all(8),
          tagTextStyle: subtitleTextStyle,
          tagContainerMargin: EdgeInsets.only(top: 8, right: 8),
          tagContainerDecoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.circular(4)
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            shareButtons(),
            articleContent(),
            footer(),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                'Detik Health',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Text(
                    'Share to ',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light
                    ),
                  ),
                  SizedBox(width: 8,),
                  shareButtons()
                ],
              )
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              header(),
              content(),
            ],
          ),
        ),
      ),
    );
  }
}
