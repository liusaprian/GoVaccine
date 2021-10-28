import 'package:flutter/material.dart';
import 'package:go_vaccine/models/UserModel.dart';
import 'package:go_vaccine/themes.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    TextEditingController fullNameController = TextEditingController(text: '');
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController phoneNumberController = TextEditingController(text: '');

    UserModel? user;
    String profileImagePath = '';
    if(ModalRoute.of(context)!.settings.arguments is UserModel) {
      user = ModalRoute.of(context)!.settings.arguments as UserModel;
    } else profileImagePath = ModalRoute.of(context)!.settings.arguments as String;

    openCamera() {
      Navigator.pushNamed(context, '/camera');
    }

    Future<void> _optionsDialogBox() {
      return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Text(
                    'Ambil gambar',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium
                    ),
                  ),
                  onTap: openCamera,
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  child: Text(
                    'Pilih dari galeri',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      );
    }

    Widget header() {
      return Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios , color: primaryColor,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Edit Profile',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.check , color: primaryColor, size: 28,),
            onPressed: () {
              UserModel newUserData = UserModel(
                email: emailController.text,
                fullName: fullNameController.text,
                phoneNumber: phoneNumberController.text,
              );
            },
          ),
        ],
      );
    }

    Widget profilePicture() {
      return GestureDetector(
        onTap: () => _optionsDialogBox(),
        child: Container(
          margin: EdgeInsets.only(top: 32),
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundImage:
                        NetworkImage(user!.photoUrl ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png')
                  ),
                  Positioned(
                    top: -4,
                    left: 32,
                    child: RawMaterialButton(
                      onPressed: () {},
                      fillColor: primaryColor,
                      elevation: 2,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: white,
                      ),
                      padding: EdgeInsets.all(8),
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget email() {
      return Container(
        margin: EdgeInsets.only(top: 48),
        decoration: BoxDecoration(
          border: Border.all(
            color: grey,
            width: 2
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: TextFormField(
            style: blackTextStyle,
            initialValue: user!.email,
            decoration: InputDecoration.collapsed(
                hintText: 'Email',
                hintStyle: subtitleTextStyle
            ),
          ),
        ),
      );
    }

    Widget name() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: grey,
            width: 2
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: TextFormField(
            style: blackTextStyle,
            initialValue: user!.fullName,
            decoration: InputDecoration.collapsed(
                hintText: 'Nama',
                hintStyle: subtitleTextStyle
            ),
          ),
        ),
      );
    }

    Widget phoneNumber() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: grey,
            width: 2
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: TextFormField(
            controller: phoneNumberController,
            style: blackTextStyle,
            initialValue: user!.phoneNumber,
            decoration: InputDecoration.collapsed(
              hintText: 'Nomor Telepon',
              hintStyle: subtitleTextStyle
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16, horizontal: 25),
          child: ListView(
            children: [
              header(),
              profilePicture(),
              email(),
              name(),
              phoneNumber(),
            ],
          ),
        ),
      ),
    );
  }
}
