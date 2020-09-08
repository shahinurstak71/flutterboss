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
  final GlobalKey<ScaffoldState>_globalKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Drawer"),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.accessibility), onPressed: (){

          _globalKey.currentState.openDrawer();
        }),
      ),
      body: Center(
        child: RaisedButton(onPressed: (){
          _globalKey.currentState.openDrawer();
        }),
      ),
    );
  }
}

