import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_vaccine/themes.dart';

class PicturePreviewPage extends StatefulWidget {
  final String imagePath;

  PicturePreviewPage({required this.imagePath});

  @override
  _PicturePreviewPageState createState() => _PicturePreviewPageState();
}

class _PicturePreviewPageState extends State<PicturePreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
        backgroundColor: primaryColor,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.file(
                File(
                  widget.imagePath
                ),
                fit: BoxFit.cover
              )
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      size: 32,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/edit-profile', arguments: widget.imagePath);
                    },
                    icon: Icon(
                      Icons.check_circle_outline_outlined,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
