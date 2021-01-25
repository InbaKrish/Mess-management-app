import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_management_app/menu/menu_opt1.dart';

class ChooseMenu extends StatefulWidget {
  String name;
  ChooseMenu(this.name);
  @override
  _ChooseMenuState createState() => _ChooseMenuState();
}

class _ChooseMenuState extends State<ChooseMenu> {
  Set usersliked_menu1 = {};
  Set usersliked_menu2 = {};
  var voters;
  var data;
  bool voted1 = false;
  bool voted2 = false;

  void likeMenu(var name, var menu) {
    if (menu == 1) {
      if (this.usersliked_menu1.contains(name)) {
        this.usersliked_menu1.remove(name);
      } else {
        voted1 = true;
        this.usersliked_menu1.add(name);
      }
    } else {
      if (this.usersliked_menu2.contains(name)) {
        this.usersliked_menu2.remove(name);
      } else {
        voted2 = true;
        this.usersliked_menu2.add(name);
      }
    }
    (menu == 1)
        ? data = {'users_liked': usersliked_menu1.toList()}
        : data = {'users_liked': usersliked_menu2.toList()};
    CollectionReference cr =
        FirebaseFirestore.instance.collection("menu_opt$menu");
    cr.doc('Liked').update(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.green[50]])),
        child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return OptScreens(0);
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.purple[300], Colors.blue[100]])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(width: 5),
                      Text("MENU 1",
                          style: GoogleFonts.orbitron(
                              textStyle: TextStyle(
                                  color: Colors.blue[900],
                                  letterSpacing: 2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(width: 10),
                      Column(
                        children: <Widget>[
                          RaisedButton(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(color: Colors.transparent)),
                            onPressed: () {
                              setState(() {
                                voted1 = !voted1;
                              });
                            },
                            child: Text('VOTE'),
                            color: (voted1) ? Colors.blue : Colors.purple[50],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('12')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return OptScreens(1);
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.red[400], Colors.blue[100]])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(width: 5),
                      Text("MENU 2",
                          style: GoogleFonts.orbitron(
                              textStyle: TextStyle(
                                  color: Colors.blue[900],
                                  letterSpacing: 2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(width: 10),
                      Column(
                        children: <Widget>[
                          RaisedButton(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(color: Colors.transparent)),
                            onPressed: () {
                              setState(() {
                                voted2 = !voted2;
                              });
                            },
                            child: Text('VOTE'),
                            color: (voted2) ? Colors.blue : Colors.red[100],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('20')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ]));
  }
}
