import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _nameValue = "--------";
  var _phoneNumberValue = "--------";
  var _emailValue = "--------";
  var _nidNumberValue = "--------";
  var _genderValue = "--------";
  var _dateOfBirthValue = "--------";
  var _cityValue = "--------";
  var _addressValue = "--------";

  String _userId = "";
  String _accessToken = "";
  String _refreshToken = "";
  String _imageLink = "";
  var cityList = "";
  var data;
  bool shimmerStatus = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: const Text("My Profile"),
        backgroundColor: Colors.appRed,
        automaticallyImplyLeading: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildImageSection(),

        ],
      ),
    ));
  }





  Widget _buildImageSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            InkResponse(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(65.0),
                child: Container(
                    height: 130,
                    width: 130,
                    color: Colors.black26,
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/default_image.png',
                      image: _imageLink,
                      imageErrorBuilder: (context, url, error) => Image.asset(
                        'assets/images/default_image.png',
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              onTap: () {
                if (_imageLink.isNotEmpty) {

                }
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 90,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 27,
                        ))
                  ],
                ),
              ],
            )
          ],
        ),
        Text(
          _nameValue,
          style: const TextStyle(
            fontSize: 22,
            //fontSize: MediaQuery.of(context).size.height / 25,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }










}
