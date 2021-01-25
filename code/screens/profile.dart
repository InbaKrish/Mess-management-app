import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_management_app/screens/login_screen.dart';
import 'package:mess_management_app/screens/profile_set.dart';
import 'package:mess_management_app/services/auth.dart';

class ProfileScreen extends StatefulWidget {
  final String pic;
  final String name;
  ProfileScreen(this.pic, this.name);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget info(snapshot) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Icon(Icons.apartment, color: Colors.blue[900]),
                SizedBox(
                  width: 20,
                ),
                Text('Hostel : ${snapshot['hostel']}',
                    style: GoogleFonts.orbitron(
                        textStyle: TextStyle(
                      color: Colors.blue[900],
                      letterSpacing: 1,
                      fontSize: 17,
                    ))),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Icon(Icons.meeting_room, color: Colors.blue[900]),
                SizedBox(
                  width: 20,
                ),
                Text('Room No : ${snapshot['roomno']}',
                    style: GoogleFonts.orbitron(
                        textStyle: TextStyle(
                      color: Colors.blue[900],
                      letterSpacing: 1,
                      fontSize: 17,
                    ))),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(widget.pic),
          ),
          SizedBox(
            height: 15,
          ),
          Text(widget.name,
              style: GoogleFonts.orbitron(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                      letterSpacing: 2,
                      fontSize: 20))),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.blue[300],
            endIndent: 10,
            indent: 10,
            thickness: 1,
            height: 10,
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.name)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Text("No data Available , try updating profile...");
                return info(snapshot.data);
              }),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.blue[300],
            endIndent: 10,
            indent: 10,
            thickness: 1,
            height: 10,
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            textColor: Colors.black54,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SetProfile(widget.name);
                  },
                ),
              );
            },
            color: Colors.blue[300],
            elevation: 10,
            child: Text("Update Profile"),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            textColor: Colors.black54,
            onPressed: () {
              signOutGoogle();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            color: Colors.blue[300],
            elevation: 10,
            child: Text("Sign Out"),
          )
        ],
      ),
    );
  }
}
