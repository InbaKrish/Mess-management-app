import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_app/screens/homeScreen.dart';
import 'package:mess_management_app/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("  Welcome 😊",
              style: GoogleFonts.orbitron(
                  textStyle: TextStyle(
                      color: Colors.blue[900],
                      letterSpacing: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue[200], Colors.green[100]])),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image(
                    color: Colors.blue,
                    height: 230,
                    width: 230,
                    image: AssetImage('assets/food.png'),
                  ),
                ),
                SizedBox(height: 50),
                _signInButton(context),
              ],
            )));
  }
}

List l;

setData() {
  var data = {'name': l[0], 'hostel': 'No data', 'roomno': 'No data'};
  CollectionReference cr = FirebaseFirestore.instance.collection("users");
  final snapshot = cr.doc(l[0]).get();

  snapshot.then((value) {
    if (value.data() == null) {
      cr.doc(l[0]).set(data);
    }
  });
}

Widget _signInButton(context) {
  return OutlineButton(
    splashColor: Colors.blue,
    onPressed: () {
      signInWithGoogle().then((results) {
        if (results != null) {
          l = results;
          print("Output .....................................");
          print(results);
          setData();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return HomeScreen(results);
              },
            ),
          );
        }
      });
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.blueAccent),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
