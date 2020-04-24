import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/models/user.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

final userRef = Firestore.instance.collection('users');
User currentUser;

class _ProfileState extends State<Profile> {

  check() async{
    final GoogleSignInAccount user = googleSignIn.currentUser;
    DocumentSnapshot doc = await userRef.document(user.id).get();
    currentUser = User.fromDocument(doc);
    print(currentUser);
    print(currentUser.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "Profile"),
      body: Center(
        child: RaisedButton(
          onPressed: check,
        ),
      ),
    );
  }
}
