import 'package:flutter/material.dart';
import 'classes.dart';

class ArtsPage extends StatefulWidget {
  @override
  _ArtsPageState createState() => _ArtsPageState();
}

class _ArtsPageState extends State<ArtsPage> {
  var counter = 0;

  List qList = [
    ArtsQuestions("1.Arts serve us for pleasure only.", false),
    ArtsQuestions(
        "2. A “giant” of the arts does not influence contemporary artists.",
        false),
    ArtsQuestions(
        "3. Michelangelo's painting The Last Judgment depicts Adam and Eve being expelled from the garden of Eden by an angel holding a sword.",
        false),
    ArtsQuestions(
        "4. Michelangelo was an Italian Renaissance artist who was so talented that he was given the nickname Il Divino.",
        true),
    ArtsQuestions(
        "5. Symbols are visual images or even colors within a work of art that viewers may recognize and associate with specific meanings",
        true),
    ArtsQuestions(
        "6. Adolf Hitler and the Nazi party prohibited modern art and wanted to inflame public opinion against the artists who created it.",
        true),
    ArtsQuestions(
        "7. Light and Pigment interact to create our perception of the color in objects",
        true),
    ArtsQuestions(
        "8. Green color in Islamic art is associated with the peacefulness of prayer?",
        true),
    ArtsQuestions(
        "9.There are 2 main types of Sculpture: Relief, Free Standing.", true),
    ArtsQuestions(
        "10.the experience of color is very personal and subjective", true),
  ];

  var score = 0;

  checkWin(bool userChoice, BuildContext context) {
    if (userChoice == qList[counter].isCorrect) {
      print("correct");

      score = score + 5;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        content: Text("Correct!"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      print("false");
      score = score + 0;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        content: Text("Incorrect!"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
    setState(() {
      if (counter < 9) {
        counter = counter + 1;
      }
    });
  }

  reset() {
    setState(() {
      counter = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Arts Quiz',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF4F3E3),
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/arts.jpg"), fit: BoxFit.fill),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text("Score : $score /50",
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      child: InkWell(
                        child: Text(
                          "Reset Game",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: reset,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Color(0xFF2196F3))),
                height: 90.0,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FittedBox(
                      child: Text(qList[counter].qText,
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => checkWin(true, context),
                    padding: EdgeInsets.fromLTRB(30.0, 30.0, 50.0, 30.0),
                    child: Text(
                      "TRUE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFFF7C229),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  RaisedButton(
                    onPressed: () => checkWin(false, context),
                    padding: EdgeInsets.fromLTRB(30.0, 30.0, 50.0, 30.0),
                    child: Text(
                      "FALSE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFFF7C229),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
