import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class SetProfile extends StatefulWidget {
  final String nam;
  SetProfile(this.nam);
  @override
  _SetProfileState createState() => _SetProfileState();
}

class _SetProfileState extends State<SetProfile> {
  String name;
  String hostel;
  String roomNo;

  void setvars() {
    setState(() {
      (name != null) ? name = name : name = widget.nam;
      hostel = hostel;
      roomNo = roomNo;
    });
    if (hostel != null && roomNo != null) {
      setData();
    } else {
      Navigator.pop(context);
    }
  }

  setData() {
    var data = {
      'name': this.name,
      'hostel': this.hostel,
      'roomno': this.roomNo
    };
    CollectionReference cr = FirebaseFirestore.instance.collection("users");
    cr.doc(name).update(data);

    Navigator.pop(context);
  }

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
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    child: TextField(
                        onChanged: (value) => hostel = value,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.apartment),
                            labelText: "Hostel",
                            hintText: "Eg: 2A or 3 or 4 ")),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width - 30,
                    child: TextField(
                        onChanged: (value) => roomNo = value,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.meeting_room),
                            labelText: "Room Number",
                            hintText: "Eg: 200 or 1 etc. ")),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: setvars,
                    elevation: 12,
                    child: Text("Submit"),
                  )
                ],
              ),
            )));
  }
}
