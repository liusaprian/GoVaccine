import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/themes.dart';
import 'package:go_vaccine/widgets/ColoredCircle.dart';

class VaccineRegistrationHistoryPage extends StatefulWidget {
  @override
  _VaccineRegistrationHistoryPageState createState() => _VaccineRegistrationHistoryPageState();
}

class _VaccineRegistrationHistoryPageState extends State<VaccineRegistrationHistoryPage> {
  Option? _option;
  bool? canSmell = false;
  bool? breathDifficulty = false;
  bool? cough = false;
  bool? cold = false;
  bool? bodyPain = false;
  bool? dryThroat = false;

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

    Widget switchTab() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: subtitleTextColor,
                blurRadius: 2,
                offset: Offset(0, 2),
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Row(
                children: [
                  ColoredCircle(color: hintTextColor,),
                  SizedBox(width: 12,),
                  Text(
                    'Profil',
                    style: hintTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  ColoredCircle(color: primaryColor,),
                  SizedBox(width: 12,),
                  Text(
                    'Riwayat Medis',
                    style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget positiveCovid() {
      return Container(
        margin: EdgeInsets.only(top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Apakah anda terdiagnosa positif COVID-19?',
              style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
              ),
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: ListTile(
                    title: Text('Ya'),
                    leading: Radio<Option>(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      activeColor: primaryColor,
                      value: Option.yes,
                      groupValue: _option,
                      onChanged: (Option? value) {
                        setState(() {
                          _option = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Flexible(
                  fit: FlexFit.tight,
                  child: ListTile(
                    title: Text('Tidak'),
                    leading: Radio<Option>(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      activeColor: primaryColor,
                      value: Option.no,
                      groupValue: _option,
                      onChanged: (Option? value) {
                        setState(() {
                          _option = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget symptoms() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Centang gejala yang anda alami:',
              style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
              ),
            ),
            SizedBox(height: 8,),
            Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      checkColor: white,
                      value: canSmell,
                      onChanged: (bool? value) {
                        setState(() {
                          canSmell = value!;
                        });
                      },
                    ),
                    Text(
                      'Tidak bisa merasa/mencium bau',
                      style: blackTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      checkColor: white,
                      value: breathDifficulty,
                      onChanged: (bool? value) {
                        setState(() {
                          breathDifficulty = value!;
                        });
                      },
                    ),
                    Text(
                      'Kesulitan bernafas',
                      style: blackTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      checkColor: white,
                      value: cough,
                      onChanged: (bool? value) {
                        setState(() {
                          cough = value!;
                        });
                      },
                    ),
                    Text(
                      'Batuk',
                      style: blackTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      checkColor: white,
                      value: cold,
                      onChanged: (bool? value) {
                        setState(() {
                          cold = value!;
                        });
                      },
                    ),
                    Text(
                      'Pilek',
                      style: blackTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      checkColor: white,
                      value: bodyPain,
                      onChanged: (bool? value) {
                        setState(() {
                          bodyPain = value!;
                        });
                      },
                    ),
                    Text(
                      'Nyeri badan',
                      style: blackTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      checkColor: white,
                      value: dryThroat,
                      onChanged: (bool? value) {
                        setState(() {
                          dryThroat = value!;
                        });
                      },
                    ),
                    Text(
                      'Tenggorokan kering',
                      style: blackTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget vaccinated() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Apakah anda sudah pernah divaksin sebelumnya?',
              style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
              ),
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: ListTile(
                    title: Text('Ya'),
                    leading: Radio<Option>(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      activeColor: primaryColor,
                      value: Option.yes,
                      groupValue: _option,
                      onChanged: (Option? value) {
                        setState(() {
                          _option = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Flexible(
                  fit: FlexFit.tight,
                  child: ListTile(
                    title: Text('Tidak'),
                    leading: Radio<Option>(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      activeColor: primaryColor,
                      value: Option.no,
                      groupValue: _option,
                      onChanged: (Option? value) {
                        setState(() {
                          _option = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget otherCondition() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        child: Column(
          children: [
            Text(
              'Apakah anda memiliki kondisi medis lain yang harus kami ketahui?',
              style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
              ),
            ),
            SizedBox(height: 12,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: hintTextColor,
                    width: 1
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(12),
              child: Center(
                child: TextFormField(
                  maxLines: 3,
                  style: blackTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: '\"Saya memiliki asma\"',
                      hintStyle: subtitleTextStyle
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget submitBtn() {
      return Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: subtitleTextColor,
              blurRadius: 2,
              offset: Offset(0, 2),
            )
          ]
        ),
        margin: EdgeInsets.only(top: 24, bottom: 4),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: InkWell(
          onTap: () {

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selesai',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold
                ),
              ),
            ],
          ),
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
              switchTab(),
              positiveCovid(),
              symptoms(),
              vaccinated(),
              otherCondition(),
              submitBtn()
            ],
          ),
        ),
      ),
    );
  }
}

enum Option {yes, no}
