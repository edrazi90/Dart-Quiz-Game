import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TextEditingController weightController = TextEditingController();
  //TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rayie Quiz"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            Container(
              height:200,
              width: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/science.jpg"),
                        fit: BoxFit.fill
                        
                        )
                        ),
                        ),


                 Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  child: Text('PLAY'),
                  onPressed: (){},
                )),


                Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  child: Text('HIGHSCORE'),
                  onPressed: (){},
                )),


                Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  child: Text('PROFILE'),
                  onPressed: (){},
                )),

              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  child: Text('EXIT'),
                  onPressed: (){},
                )),





          ],
        ),
      ),
    );
  }
}
