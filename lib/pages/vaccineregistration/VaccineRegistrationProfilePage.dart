import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/themes.dart';
import 'package:go_vaccine/widgets/ColoredCircle.dart';

class VaccineRegistrationProfilePage extends StatefulWidget {
  @override
  _VaccineRegistrationProfilePageState createState() => _VaccineRegistrationProfilePageState();
}

class _VaccineRegistrationProfilePageState extends State<VaccineRegistrationProfilePage> {
  Gender? _gender;

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
                  ColoredCircle(color: primaryColor,),
                  SizedBox(width: 12,),
                  Text(
                    'Profil',
                    style: blackTextStyle.copyWith(
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
                  ColoredCircle(color: hintTextColor,),
                  SizedBox(width: 12,),
                  Text(
                    'Riwayat Medis',
                    style: hintTextStyle.copyWith(
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

    Widget name() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium
              ),
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
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
                        style: blackTextStyle,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Nama Depan',
                            hintStyle: subtitleTextStyle
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
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
                        style: blackTextStyle,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Nama Akhir',
                            hintStyle: subtitleTextStyle
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget birthDate() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal Lahir',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium
              ),
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
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
                        style: blackTextStyle,
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Tanggal',
                          hintStyle: subtitleTextStyle
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8,),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
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
                        style: blackTextStyle,
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Bulan',
                            hintStyle: subtitleTextStyle
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8,),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
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
                        style: blackTextStyle,
                        keyboardType: TextInputType.number,
                        maxLength: 4,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Tahun',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget gender() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Kelamin',
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
                    title: Text('Laki-laki'),
                    leading: Radio<Gender>(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      activeColor: primaryColor,
                      value: Gender.man,
                      groupValue: _gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Flexible(
                  fit: FlexFit.tight,
                  child: ListTile(
                    title: Text('Perempuan'),
                    leading: Radio<Gender>(
                      fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
                      activeColor: primaryColor,
                      value: Gender.woman,
                      groupValue: _gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _gender = value;
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

    Widget idCardNumber() {
      return Container(
        margin: EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor KTP',
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
                  style: blackTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Nomor KTP',
                      hintStyle: subtitleTextStyle
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget phoneNumber() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor Handphone',
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
                  style: blackTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Nomor Handphone',
                      hintStyle: subtitleTextStyle
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget email() {
      return Container(
        margin: EdgeInsets.only(top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
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
                  style: blackTextStyle,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Email',
                      hintStyle: subtitleTextStyle
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget continueBtn() {
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
        margin: EdgeInsets.only(top: 24),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/vaccine-registration-history');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selanjutnya',
                style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold
                ),
              ),
              SizedBox(width: 12,),
              Icon(Icons.arrow_forward_ios_sharp, color: white, size: 22),
            ],
          ),
        )
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 25),
          width: double.infinity,
          child: ListView(
            children: [
              backBtn(),
              switchTab(),
              name(),
              birthDate(),
              gender(),
              idCardNumber(),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: phoneNumber(),
                  ),
                  SizedBox(width: 12),
                  Flexible(
                    fit: FlexFit.tight,
                    child: email(),
                  ),
                ],
              ),
              continueBtn(),
            ],
          ),
        ),
      ),
    );
  }
}

enum Gender {man, woman}