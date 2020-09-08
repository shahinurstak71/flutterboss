
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future getData() async {
    // ignore: deprecated_member_use
    var firestore = Firestore.instance;
    // ignore: deprecated_member_use
    QuerySnapshot qn = await firestore.collection("Countries").getDocuments();
    // ignore: deprecated_member_use
    return qn.documents;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (_,snapshot){
            return ListView.builder(
                itemCount: snapshot.data.lenght,
                itemBuilder: (_,index){
                  DocumentSnapshot data = snapshot.data[index];
                  return ListTile(
                    title: Text(data["name"]),
                  );
                });
          }),

    );
  }
}

