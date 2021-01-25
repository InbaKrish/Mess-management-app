import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class DinnerScreen extends StatefulWidget {
  @override
  _DinnerScreenState createState() => _DinnerScreenState();
}

class _DinnerScreenState extends State<DinnerScreen> {
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
                .doc('dinner')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                try {
                  print(snapshot.data['nof']);
                  print("has data");
                  return _displayContent(snapshot.data);
                } catch (e) {
                  print("no data");
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
                print("no data");
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
