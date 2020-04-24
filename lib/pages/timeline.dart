import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

final userRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  //List<dynamic> users = [];

  @override
  void initState() {
    // TODO: implement initState
    //getUsers();
    //getUserById();
    //createUser();
    //updateUser();
    deleteUser();
    super.initState();
  }

  createUser() async{
    await userRef.document('aahssdbdddnd').setData({
      'username': 'Jeff',
      'postCount': 0,
      'isAdmin': false
    });
  }

  updateUser() async{
    await userRef.document('aahssdbdddnd').updateData({
      'username': 'Jeff Mark',
      'postCount': 0,
      'isAdmin': false
    });
  }

  deleteUser() async{
    await userRef.document('aahssdbdddnd').delete();
  }

//  getUserById() async{
//    final String id = 'Vq2Js10PXk6hQC2GHXxQ';
//    final DocumentSnapshot doc = await userRef.document(id).get();
//    print(doc.data);
//    print(doc.documentID);
//    print(doc.exists);
//  }

//  getUsers() async {
//    final QuerySnapshot snapshot = await userRef.getDocuments();
//    setState(() {
//      users = snapshot.documents;
//    });
//  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      //Realtime data
      body: StreamBuilder<QuerySnapshot>(
        stream: userRef.snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return circularProgress();
          }
          final List<Text> children = snapshot.data.documents.map((doc) => Text(doc['username'])).toList();
          return Container(
            child: ListView(
              children: children,
            ),
          );
        },
      )
    );
  }
}
