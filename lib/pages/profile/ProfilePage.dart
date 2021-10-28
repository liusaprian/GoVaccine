import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/models/UserModel.dart';
import 'package:go_vaccine/services/AuthService.dart';
import 'package:go_vaccine/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SharedPreferences? prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedPreferences();
  }

  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    saveSignedInUserEmail(String signedInEmail) async {
      prefs!.setString("current_email", signedInEmail);
    }
    Future<void> showLogoutDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Logout?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Expanded(
                    child: Text(
                      'Apa anda yakin ingin keluar?\nAnda harus login kembali nanti jika ingin masuk kembali ke aplikasi',
                      style: blackTextStyle,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('Tidak'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Ya'),
                onPressed: () {
                  saveSignedInUserEmail('');
                  AuthService().signOutFromGoogle();
                  Navigator.pushNamedAndRemoveUntil(context, '/on-boarding', (Route<dynamic> route) => false);
                },
              ),
            ],
          );
        },
      );
    }

    Widget header() {
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            getSharedPreferences();
            List<UserModel> users = snapshot.data!.docs.map((userJson) {
              return UserModel(
                email: userJson['email'],
                phoneNumber: userJson['phone_number'],
                photoUrl: userJson['photo_url'],
                fullName: userJson['full_name']
              );
            }).toList();
            UserModel? currentUser;
            users.forEach((user) {
              if(user.email == prefs?.getString('current_email'))
                currentUser = user;
            });
            return Container(
              margin: EdgeInsets.only(top: 36, right: 30, left: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                          currentUser?.photoUrl ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
                        ),
                      ),
                      SizedBox(width: 16,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentUser?.fullName ?? 'User',
                              style: blackTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: medium
                              ),
                            ),
                            Text(
                              currentUser?.phoneNumber ?? '+62123123123',
                              style: subtitleTextStyle.copyWith(
                                fontSize: 18
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 16,),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/edit-profile',
                            arguments: currentUser
                          );
                        },
                        child: Icon(
                          Icons.edit,
                          size: 32,
                          color: subtitleTextColor,
                        ),
                      )
                    ],
                  ),
                  Divider(
                    height: 60,
                    thickness: 1,
                  ),
                ],
              ),
            );
          }
          return Container(
            margin: EdgeInsets.only(top: 36, right: 30, left: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '-',
                            style: blackTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: medium
                            ),
                          ),
                          Text(
                            '-',
                            style: subtitleTextStyle.copyWith(
                              fontSize: 18
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 16,),
                    Icon(
                      Icons.edit,
                      size: 32,
                      color: subtitleTextColor,
                    )
                  ],
                ),
                Divider(
                  height: 60,
                  thickness: 1,
                ),
              ],
            ),
          );
        },
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  'Vaksinasi',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 18
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  onTap: () {

                  },
                  leading: Icon(
                    Icons.wysiwyg_outlined,
                    color: primaryColor,
                    size: 32,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: primaryColor,
                    size: 20,
                  ),
                  title: Text(
                    'Status Vaksinasi',
                    style: blackTextStyle.copyWith(
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  onTap: () {

                  },
                  leading: Icon(
                    Icons.assignment_ind_outlined,
                    color: primaryColor,
                    size: 32,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: primaryColor,
                    size: 20,
                  ),
                  title: Text(
                    'Sertifikat Vaksin',
                    style: blackTextStyle.copyWith(
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  onTap: () {

                  },
                  leading: Icon(
                    Icons.history_outlined,
                    color: primaryColor,
                    size: 32,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: primaryColor,
                    size: 20,
                  ),
                  title: Text(
                    'Riwayat & Tiket Vaksin',
                    style: blackTextStyle.copyWith(
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  'Lainnya',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 18
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  onTap: () {

                  },
                  leading: Icon(
                    Icons.favorite_border_sharp,
                    color: primaryColor,
                    size: 32,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: primaryColor,
                    size: 20,
                  ),
                  title: Text(
                    'Tips',
                    style: blackTextStyle.copyWith(
                      fontSize: 18
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  onTap: () {

                  },
                  leading: Icon(
                    Icons.announcement_outlined,
                    color: primaryColor,
                    size: 32,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: primaryColor,
                    size: 20,
                  ),
                  title: Text(
                    'Tentang',
                    style: blackTextStyle.copyWith(
                      fontSize: 18
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  onTap: () {

                  },
                  leading: Icon(
                    Icons.star_border_sharp,
                    color: primaryColor,
                    size: 32,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: primaryColor,
                    size: 20,
                  ),
                  title: Text(
                    'Rating',
                    style: blackTextStyle.copyWith(
                      fontSize: 18
                    ),
                  ),
                  subtitle: Text(
                    'v1.0.0',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  onTap: () => showLogoutDialog(),
                  leading: Icon(
                    Icons.logout_sharp,
                    color: primaryColor,
                    size: 32,
                  ),
                  title: Text(
                    'Keluar',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18
                    ),
                  ),
                ),
              ),
            ]
          ).toList(),
        ),
      );
    }

    Widget helpBox() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryColor,
        ),
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Row(
            children: [
              Icon(Icons.headset_mic_sharp, size: 48, color: white),
              SizedBox(width: 24,),
              Expanded(
                child: Text(
                  'Ada yang bisa dibantu?',
                  style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold
                  ),
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              content(),
              helpBox(),
            ],
          ),
        ),
      ),
    );
  }
}
