import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordScreen> {
  String _userId = "";
  String _accessToken = "";
  String _refreshToken = "";
  String _imageLink = "";

  final TextEditingController? _oldPassword = TextEditingController();
  final TextEditingController? _newPassword = TextEditingController();
  final TextEditingController? _confirmPassword = TextEditingController();

  bool _isObscure = true;
  bool _isObscure2 = true;
  bool _isObscure3 = true;

  final FocusNode _oldPasswordFocus = FocusNode();
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  late String asstoken;


  PickedFile? _imageFile;
  final ImagePicker _picker=ImagePicker();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            _imageProfile(),
            SizedBox(
              height: 50,
            ),
        Wrap(
          children: [
            RaisedButton(
               onPressed: () {  
                 showModalBottomSheet(context: context, builder: ( (builder) =>_buildBottomSheet()));
                 
               },
              child:  Text("Pick Image"),
            ),

          ],

        )

            //_buildButtonSection(),
          ],
        ),
      ),
    );
  }

  Widget _imageProfile() {
    return Stack(
      children: [
        if( _imageFile==null)...{
          CircleAvatar(
            radius: 80,

            backgroundImage:AssetImage("assets/images/download.jpg"),

          )
        }
        else...{
          CircleAvatar(
            radius: 80,

            backgroundImage:FileImage(File(_imageFile!.path)),

          )
        }

      ],
    );
  }

  // _imageFile==null ? :
  Widget _buildBottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          Text("Choose Profile photo!"),
          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(onPressed:(){
                takeImage(ImageSource.camera);
              }, icon: Icon(Icons.camera), label: Text("Camera")),
              FlatButton.icon(onPressed:(){
                takeImage(ImageSource.gallery);

              }, icon: Icon(Icons.image), label: Text("Gallery")),
            ],
          )
        ],
      ),

    );
  }

void takeImage(ImageSource source)async{
    final pickedFile= await _picker.getImage(source: source);
    setState(() {
      _imageFile=pickedFile!;
    });
}







  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        // return VerificationScreen();
        return Dialog(
          child: Wrap(
            children: [
              Container(
                  margin: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20, bottom: 20),
                  child: Center(
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        CircularProgressIndicator(
                          backgroundColor: Colors.appRed,
                          color: Colors.black,
                          strokeWidth: 5,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Changing...",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ))
            ],
            // child: VerificationScreen(),
          ),
        );
      },
    );
  }

}
