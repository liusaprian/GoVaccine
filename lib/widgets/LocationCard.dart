import 'package:flutter/material.dart';
import 'package:go_vaccine/themes.dart';

class LocationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        height: 104,
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
        margin: EdgeInsets.only(top: 16, right: 12, bottom: 12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.network(
                'https://cms.sehatq.com/cdn-cgi/image/f=auto/public/img/hospital_thumb/rumah-sakit-husada-jakarta-pusat-HCFH00000027.jpg',
                width: 112,
                height: 112,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RS Husada',
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      'Jl. Raya Mangga Besar, RW.1, Mangga Dua Sel., Kecamatan Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10730',
                      style: blackTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 12
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(height: 4,),
                    Text(
                      '3.2 km dari rumahmu',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 14
                      ),
                    )
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
