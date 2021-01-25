import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:mess_management_app/menu/morning.dart';
import 'package:mess_management_app/screens/choose_menu_screen.dart';
import 'package:mess_management_app/screens/comment_screen.dart';
import 'package:mess_management_app/screens/profile.dart';

class HomeScreen extends StatefulWidget {
  final List results;
  HomeScreen(this.results);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> l = [
      HomeScreenTiles(),
      TextWidget(widget.results[0]),
      ChooseMenu(widget.results[0]),
      ProfileScreen(widget.results[1], widget.results[0])
    ];
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
        bottomNavigationBar: BottomNavyBar(
            showElevation: true,
            backgroundColor: Colors.blue[100],
            items: [
              BottomNavyBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Today's menu"),
                  activeColor: Colors.red[400],
                  inactiveColor: Colors.blue[400]),
              BottomNavyBarItem(
                  icon: Icon(Icons.message),
                  title: Text("Review"),
                  activeColor: Colors.green[400],
                  inactiveColor: Colors.blue[400]),
              BottomNavyBarItem(
                  icon: Icon(Icons.how_to_vote),
                  title: Text("choose menu"),
                  activeColor: Colors.purple[400],
                  inactiveColor: Colors.blue[400]),
              BottomNavyBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                  activeColor: Colors.brown,
                  inactiveColor: Colors.blue[400]),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            selectedIndex: _currentindex,
            onItemSelected: (index) {
              setState(() {
                _currentindex = index;
                print(_currentindex);
              });
            }),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.green[50]])),
            child: l[_currentindex]));
  }
}

class HomeScreenTiles extends StatefulWidget {
  @override
  _HomeScreenTilesState createState() => _HomeScreenTilesState();
}

class _HomeScreenTilesState extends State<HomeScreenTiles> {
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
                    return Screens(0);
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.green[100], Colors.blue[100]])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("  BreakFast",
                              style: GoogleFonts.orbitron(
                                  textStyle: TextStyle(
                                      color: Colors.blue[800],
                                      letterSpacing: 2,
                                      fontSize: 18))),
                          SizedBox(height: 8),
                          Text(
                            "    7:30AM to 11:30AM",
                          )
                        ],
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/breakfast.jpg"),
                        radius: 30,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Screens(1);
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.green[100], Colors.yellow[200]])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Lunch",
                              style: GoogleFonts.orbitron(
                                  textStyle: TextStyle(
                                      color: Colors.blue[800],
                                      letterSpacing: 2,
                                      fontSize: 18))),
                          SizedBox(height: 8),
                          Text(
                            "    12:15PM to 2:30PM",
                          )
                        ],
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/lunch.JPG"),
                        radius: 30,
                      )
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
                    return Screens(2);
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.green[100], Colors.orange[200]])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("  Supper",
                              style: GoogleFonts.orbitron(
                                  textStyle: TextStyle(
                                      color: Colors.blue[800],
                                      letterSpacing: 2,
                                      fontSize: 18))),
                          SizedBox(height: 8),
                          Text(
                            "    4:20PM to 6:00PM",
                          )
                        ],
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/supper.jpg"),
                        radius: 30,
                      )
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
                    return Screens(3);
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.green[100], Colors.purple[200]])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Dinner",
                              style: GoogleFonts.orbitron(
                                  textStyle: TextStyle(
                                      color: Colors.blue[800],
                                      letterSpacing: 2,
                                      fontSize: 18))),
                          SizedBox(height: 8),
                          Text(
                            "    7:00PM to 10:15PM",
                          )
                        ],
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/dine.jpg"),
                        radius: 30,
                      )
                    ],
                  ),
                ),
              )
            ]));
  }
}
