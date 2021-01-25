import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_management_app/menu/menu_opt2.dart';

class OptScreens extends StatefulWidget {
  final int opt;
  OptScreens(this.opt);
  @override
  _OptScreensState createState() => _OptScreensState();
}

class _OptScreensState extends State<OptScreens> {
  List l = <Widget>[Menu1(), Menu2()];
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
            child: l[widget.opt]));
  }
}

class Menu1 extends StatefulWidget {
  @override
  _Menu1State createState() => _Menu1State();
}

class _Menu1State extends State<Menu1> {
  Widget _displayContent(data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 20.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data['nof'],
          itemBuilder: (context, index) {
            final food = data['food$index'];
            return Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          food[0].toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(food[1])
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                          colors: [Colors.blue[50], Colors.red[100]],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                ),
                SizedBox(
                  width: 12,
                )
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 80,
        ),
        Text(
          'Breakfast',
          style: TextStyle(
              color: Colors.blue[800],
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('menu_opt1')
                .doc('morning')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                try {
                  print(snapshot.data['nof']);
                  return _displayContent(snapshot.data);
                } catch (e) {
                  print('No data on menu1 breakfast');
                  return Text(
                    '\n\nNo data available ...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  );
                }
              } else {
                print('No data on menu1 lunch');
                return Text(
                  '\n\nNo data available ...',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                );
              }
            },
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Lunch',
          style: TextStyle(
              color: Colors.blue[800],
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('menu_opt1')
                .doc('lunch')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                try {
                  print(snapshot.data['nof']);
                  return _displayContent(snapshot.data);
                } catch (e) {
                  print('No data on menu1 lunch');
                  return Text(
                    '\n\nNo data available ...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  );
                }
              } else {
                print('No data on menu1 lunch');
                return Text(
                  '\n\nNo data available ...',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                );
              }
            },
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Supper',
          style: TextStyle(
              color: Colors.blue[800],
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('menu_opt1')
                .doc('supper')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                try {
                  print(snapshot.data['nof']);
                  return _displayContent(snapshot.data);
                } catch (e) {
                  print('No data on menu1 lunch');
                  return Text(
                    '\n\nNo data available ...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  );
                }
              } else {
                print('No data on menu1 lunch');
                return Text(
                  '\n\nNo data available ...',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                );
              }
            },
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Dinner',
          style: TextStyle(
              color: Colors.blue[800],
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('menu_opt1')
                .doc('dinner')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                try {
                  print(snapshot.data['nof']);
                  return _displayContent(snapshot.data);
                } catch (e) {
                  print('No data on menu1 lunch');
                  return Text(
                    '\n\nNo data available ...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  );
                }
              } else {
                print('No data on menu1 lunch');
                return Text(
                  '\n\nNo data available ...',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
