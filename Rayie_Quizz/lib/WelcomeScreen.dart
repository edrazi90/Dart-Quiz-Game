import 'dart:async';

import 'package:flutter/material.dart';
import 'home.dart';


class LoadingPage extends StatefulWidget {
  LoadingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  //TextEditingController weightController = TextEditingController();
  //TextEditingController heightController = TextEditingController();

@override
  void initState(){ 
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text(
          "RAYIE QUIZ",
          style: TextStyle(fontSize: 50.0, color: Colors.white),
        ),
      ),
    );
  }
}
