
import 'package:flutter/material.dart';
import 'classes.dart';


class ArtsPage extends StatefulWidget {
  @override
  _ArtsPageState createState() => _ArtsPageState();
}

class _ArtsPageState extends State<ArtsPage> {
 
 var counter=0;
   
    List qList =[
    ArtsQuestions("1.The human body has four lungs.", false),
   ArtsQuestions("2.Kelvin is a measure of temperature.", true),
    ArtsQuestions("3.The Atlantic Ocean is the biggest ocean on Earth.",false),
    ArtsQuestions("4.Sharks are mammals.",false),
   ArtsQuestions("5.The human skeleton is made up of less than 100 bones.",false),
    ArtsQuestions("6.Atomic bombs work by atomic fission.",true),
    ArtsQuestions("7.Molecules are chemically bonded.",true),
   ArtsQuestions("8.Spiders have six legs.",false),
    ArtsQuestions("9.Mount Kilimanjaro is the tallest mountain in the world.",false),
    ArtsQuestions("10.The study of plants is known as botany.",true),

  ];

     var score=0;

    checkWin(bool userChoice , BuildContext context )
{
  

    if(userChoice==qList[counter].isCorrect)
 { 
    print("correct");
     
     score= score+5;
    final snackbar = SnackBar(
      duration: Duration(milliseconds : 500),
      backgroundColor: Colors.green,
      content: Text("Correct!"),);
    Scaffold.of(context).showSnackBar(snackbar);
 }
 else 
 {print("false");
        score = score+0;
    final snackbar = SnackBar(
      duration: Duration(milliseconds : 500),
      backgroundColor: Colors.red,
      content: Text("Incorrect!"),
      );
    Scaffold.of(context).showSnackBar(snackbar);
 }
    setState(() {
 
   if(counter<9)
   {
     counter = counter +1;
   }
 
    
  });
  
  
} 
 
 reset()
 {
   setState(() {
     counter = 0;
     score =0;
   });
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
        backgroundColor: Colors.indigo,
   
        title: Text('QUIZ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
       backgroundColor: Color(0xFFF4F3E3),

      body: Builder(
              builder : (BuildContext context) => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              Container(height: 200,
              width: 500,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/arts.jpg"),
                fit: BoxFit.fill ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 20)),


              Container(
             
                child: Row(
                 
              
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container( 
                        child:Text("Score : $score /50",style: TextStyle(color : Colors.brown , 
                    fontSize: 20,fontWeight: FontWeight.bold)),
                     ),
                   
                Container( child:
                 InkWell(
                     child: Text("Reset Game",style: TextStyle(fontSize: 20,color: Colors.redAccent,fontWeight: FontWeight.bold),),
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
                    border: Border.all(color: Color(0xFF2196F3))
                  ),
                  height: 90.0,
                  width: 400,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         FittedBox(child: Text(qList[counter].qText,style: TextStyle(fontSize: 18.0,)),)

                       ],
                     ),             
                     
               ),

              Padding(padding: EdgeInsets.only(top: 30)),
                      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                   
                RaisedButton(onPressed:()=> checkWin(true, context),

                padding: EdgeInsets.fromLTRB(30.0, 30.0, 50.0, 30.0),
                
                child: Text("TRUE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

                color:  Color(0xFFF7C229),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                ),
                 
              RaisedButton(onPressed: ()=> checkWin(false,context),

                padding: EdgeInsets.fromLTRB(30.0, 30.0, 50.0, 30.0),
                
                child: Text("FALSE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

                color: Color(0xFFF7C229),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
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