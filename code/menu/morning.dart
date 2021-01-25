import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_management_app/menu/dinner.dart';
import 'package:mess_management_app/menu/lunch.dart';
import 'package:mess_management_app/menu/supper.dart';

class Screens extends StatefulWidget {
  final int screens;
  Screens(this.screens);
  @override
  _ScreensState createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  List l = <Widget>[
    MorningScreen(),
    LunchScreen(),
    SupperScreen(),
    DinnerScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("Moorthy Mess",
              style: GoogleFonts.orbitron(
                  textStyle: TextStyle(
                      color: Colors.blue[900],
                      letterSpacing: 2,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.green[50]])),
            child: l[widget.screens]));
  }
}

class MorningScreen extends StatefulWidget {
  @override
  _MorningScreenState createState() => _MorningScreenState();
}

class _MorningScreenState extends State<MorningScreen> {
  var color = false;
  Widget _displayContent(data) {
    return ListView.builder(
      itemCount: data['nof'],
      itemBuilder: (context, index) {
        final food = data['food$index'];
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.filter_center_focus,
                    color: Colors.green[900],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  (food.length > 2)
                      ? CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(food[2]),
                          radius: 25,
                        )
                      : Container(),
                  Expanded(
                    child: ListTile(
                      title: Text(food[0].toUpperCase()),
                      subtitle: Text("  ${food[1]}"),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              endIndent: 12,
              indent: 12,
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6),
      child: Column(
        children: <Widget>[
          Expanded(
              child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('current_menu')
                .doc('morning')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                try {
                  print(snapshot.data['nof']);
                  print(" has data");
                  return _displayContent(snapshot.data);
                } catch (e) {
                  print(" no data");
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: Text("No data Available...",
                              style: GoogleFonts.orbitron(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 2,
                                      fontSize: 18)))));
                }
              } else {
                print(" no data");
                return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text("No data Available...",
                            style: GoogleFonts.orbitron(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 2,
                                    fontSize: 18)))));
              }
            },
          ))
        ],
      ),
    );
  }
}
