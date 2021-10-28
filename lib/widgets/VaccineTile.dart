import 'package:flutter/material.dart';
import 'package:go_vaccine/models/VaccineModel.dart';
import 'package:go_vaccine/pages/vaccine/VaccineDetailPage.dart';
import 'package:go_vaccine/themes.dart';

class VaccineTile extends StatelessWidget {

  final VaccineModel vaccine;
  VaccineTile(this.vaccine);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => VaccineDetailPage(vaccine: vaccine)),);
      },
      child: Container(
        height: 80,
        width: double.infinity,
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
        margin: EdgeInsets.only(top: 16, right: 4, left: 4),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Image.network(
                vaccine.imageUrl,
                width: 100,
                height: 80,
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
                      vaccine.name,
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      vaccine.desc,
                      style: blackTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 12
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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
