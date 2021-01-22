
import 'package:QuizzTime/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';




TextStyle style = TextStyle(fontFamily: 'Aerial', fontSize: 20.0);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.purple[300],
      ),
      home: MyLoginPage(title: 'Login'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
    TextStyle style = TextStyle(fontFamily: 'Aerial', fontSize: 20.0);
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  
      @override
    initState() {
      emailInputController = new TextEditingController();
      pwdInputController = new TextEditingController();
      super.initState();
    }
  
    String emailValidator(String value) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return 'Email format is invalid';
      } else {
        return null;
      }
    }
  
    String pwdValidator(String value) {
      if (value.length < 8) {
        return 'Password must be longer than 8 characters';
      } else {
        return null;
      }
    }

//Forget Password
    Future<void> resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
}

    @override
    Widget build(BuildContext context) {
      final emailField = TextFormField(
        obscureText: false,
        style: style,
        key: _loginFormKey,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
            hintText: "Email:",
            filled: true,
            fillColor: Colors.white70,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                  controller: emailInputController,
                      keyboardType: TextInputType.emailAddress,
                      validator: emailValidator,
                      
      );
      final passwordField = TextFormField(
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0),
            hintText: "Password:",
            filled: true,
            fillColor: Colors.white70,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                controller: pwdInputController,
                validator: pwdValidator,
      );
      final loginButon = Material(
        elevation: 9.0,
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.lightBlue[300],
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: Text("Login",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
       onPressed: () {
                        if (_loginFormKey.currentState.validate()) {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailInputController.text,
                                  password: pwdInputController.text)
                              .then((currentUser) => FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(currentUser.toString())
                                  .get()
                                  .then((DocumentSnapshot result) =>
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyHomePage(
                                                  ))))
                                  .catchError((err) => print(err)))
                              .catchError((err) => print(err));
                        }
       }
        ),
      );
      final registerButton  = Material(
        elevation: 9.0,
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.deepPurpleAccent,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          child: Text("Register Now",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage(),
            ));
          },
        ),
        
      );
  
      return Scaffold(
        resizeToAvoidBottomPadding: false, 
        body: Center(
          child: Container(
            key: _loginFormKey,
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/logo.png"),
                        fit: BoxFit.contain,
                        )
                    ),
                  ),
                  SizedBox(height: 45.0),
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  SizedBox( height: 35.0),
                  loginButon,
                  SizedBox(height: 20.0),
                  registerButton,
                  Padding(padding:EdgeInsets.fromLTRB(20, 15, 10, 15)),
                  Text("Forgot password?"),
                  FlatButton(
                    color: Colors.blue.shade400,
                    child: Text("Reset"),
                    onPressed: () {
                      resetPassword(emailInputController.text);
                    },
                  )
                  ],
              ),
            ),
          ),
        ),
      );
    }
  }
  
 

