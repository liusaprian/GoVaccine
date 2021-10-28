import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/models/UserModel.dart';
import 'package:go_vaccine/models/VaccineModel.dart';
import 'package:go_vaccine/services/CovidInformationService.dart';
import 'package:go_vaccine/themes.dart';
import 'package:go_vaccine/widgets/VaccineTile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String name = 'User';

  @override
  Widget build(BuildContext context) {
    //fetch user name
    final String? userEmail =
        ModalRoute.of(context)!.settings.arguments as String?;
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      if (user!.displayName != null && userEmail == null)
        name = user.displayName!;
    });
    if (userEmail != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .get()
          .then((value) {
        if (value.exists) {
          setState(() {
            var userModel = UserModel.fromJson(value.data()!);
            name = (userModel.fullName) ?? 'user';
          });
        }
      });
    }

    Widget header() {
      return Container(
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Halo, $name',
                style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: bold),
                maxLines: 1,
              ),
            ),
            Icon(
              Icons.notifications,
              color: white,
            )
          ],
        ),
      );
    }

    Widget searchBar() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/search');
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: subtitleTextColor,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
            color: white,
            borderRadius: BorderRadius.circular(24),
          ),
          margin: EdgeInsets.only(top: 20),
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Cari Lokasi Vaksin',
                    style: hintTextStyle,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: primaryColor,
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget information() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        width: double.infinity,
        child: FutureBuilder<List<dynamic>>(
            future: CovidInformationService().getCovidInformation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: subtitleTextColor,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  'assets/image_terkonfirmasi.png',
                                  height: 128,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Terkonfirmasi',
                                style: subtitleTextStyle.copyWith(
                                    fontSize: 14, fontWeight: medium),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                snapshot.data![0]['positif'].toString(),
                                style: primaryTextStyle.copyWith(
                                    fontSize: 22, fontWeight: medium),
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: subtitleTextColor,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  'assets/image_sembuh.png',
                                  height: 128,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Sembuh',
                                style: subtitleTextStyle.copyWith(
                                    fontSize: 14, fontWeight: medium),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                snapshot.data![0]['sembuh'].toString(),
                                style: primaryTextStyle.copyWith(
                                    fontSize: 22, fontWeight: medium),
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  ],
                );
              } else
                print('Error');
              return Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: subtitleTextColor,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                'assets/image_terkonfirmasi.png',
                                height: 128,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Terkonfirmasi',
                              style: subtitleTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              '0',
                              style: primaryTextStyle.copyWith(
                                  fontSize: 22, fontWeight: medium),
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: subtitleTextColor,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                'assets/image_sembuh.png',
                                height: 128,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Sembuh',
                              style: subtitleTextStyle.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              '0',
                              style: primaryTextStyle.copyWith(
                                  fontSize: 22, fontWeight: medium),
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              );
            }),
      );
    }

    Widget registerVaccineBox() {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 24),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      '#AyoVaksinSekarang',
                      style: whiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium
                      ),
                    ),
                    Container(
                      width: 172,
                      margin: EdgeInsets.only(top: 16),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/vaccine-registration-profile');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                        child: Text(
                          'Daftar Disini',
                          style: blackTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: AspectRatio(
                aspectRatio: 1/1,
                child: Image.asset(
                  'assets/image_vaksin.png',
                ),
              ),
            ),
          )
        ],
        clipBehavior: Clip.none,
      );
    }

    Widget vaccineHeader() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Vaksin',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold
              ),
            ),
            Center(
              child: Text(
                'Lihat Semua',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: light
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget vaccines() {
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('vaccines').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Container(
              margin: EdgeInsets.only(bottom: 4),
              child: Column(
                children: snapshot.data!.docs.map((vaccineJson) {
                  VaccineModel vaccine = VaccineModel(
                    imageUrl: (vaccineJson.data() as Map)['imageUrl'],
                    name: (vaccineJson.data() as Map)['name'],
                    desc: (vaccineJson.data() as Map)['description'],
                    efficacy: (vaccineJson.data() as Map)['efficacy'],
                    permissions: (vaccineJson.data() as Map)['permissions'],
                    sideEffects: (vaccineJson.data() as Map)['sideEffects'].cast<String>(),
                  );
                  print(vaccine.name);
                  return VaccineTile(vaccine);
                }).toList(),
              ),
            );
          }
          return Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            ),
          );
        },
      );
    }

    return Stack(
      children: [
        Image.asset(
          'assets/background_home.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 30, right: 30, top: 24),
          child: ListView(
            children: [
              header(),
              searchBar(),
              information(),
              registerVaccineBox(),
              vaccineHeader(),
              vaccines(),
            ],
          ),
        ),
      ],
    );
  }
}
