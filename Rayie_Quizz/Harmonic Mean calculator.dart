import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harmonic Mean Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Harmonic Mean Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TextEditingController weightController = TextEditingController();
  //TextEditingController heightController = TextEditingController();

  String _inputs = "";
  double _harmonicmean = 0;
  double total = 0;
  double _p = 0.0;
  int _length = 0;

  void _setInputs(String inputs) {
    setState(() {
      _inputs = (inputs) ?? 0.0;
    });

    if (_inputs != null) {
      List<String> _mynumbers = [""];
      List<double> _mynumbers2 = [];

      _mynumbers = _inputs.split(",");
      _mynumbers2 = _mynumbers.map(double.parse).toList();
      _length = _mynumbers2.length;

      for (int i = 0; i < _length; i++) {
        _p += (1.0 / _mynumbers2[i]);
      }

      setState(() {
        _p = (_p);
      });

      setState(() {
        _length = (_length);
      });
    }
  }

  void _calculateHM() {
    setState(() {
      _harmonicmean = (_length / (_p));
    });

    _showDialog('The Harmonic Mean is: $_harmonicmean');
  }

  void _showDialog(String status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Harmonic mean: ", textAlign: TextAlign.center),
          content: new Text(status),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
            child: new Text(widget.title, textAlign: TextAlign.center)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  //controller: Inputs Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Numbers(e.g--  1,2,3) ',
                  ),
                  onChanged: (text) {
                    _setInputs(text);
                  },
                  keyboardType: TextInputType.number,
                )),
            Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  child: Text('Press to Calculate Harmonic Mean'),
                  onPressed: _calculateHM,
                )),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(_harmonicmean.toStringAsFixed(2)),
            )
          ],
        ),
      ),
    );
  }
}
