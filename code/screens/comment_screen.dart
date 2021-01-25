import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Comments {
  String comment;
  String user;

  Comments(this.comment, this.user);
}

class TextWidget extends StatefulWidget {
  final String name;
  TextWidget(this.name);
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  final controller = TextEditingController();
  var i = 0;
  setReviews(String comment) async {
    var data = {"user": widget.name.toString(), "comment": comment};
    CollectionReference cr = FirebaseFirestore.instance.collection('reviews');
    var snapshot;
    if (i == 0) {
      snapshot = await cr.doc(widget.name).get();
    } else {
      print(i);
      snapshot = await cr.doc('${widget.name}${i.toString()}').get();
    }

    if (snapshot.exists) {
      print('exist');
      i++;
      cr.doc('${widget.name}${i.toString()}').set(data);
    } else {
      print('not exists');
      cr.doc(widget.name).set(data);
    }
  }

  void click() {
    this.setReviews(controller.text);
    controller.clear();
  }

  Widget comments(snapshot) {
    return ListView.builder(
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        final doc = snapshot.docs[index];
        return Opacity(
          opacity: 0.8,
          child: Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: Text(doc['user']),
                    subtitle: Text(doc['comment']),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('reviews')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                          child: Text(
                        "No comments has been posted",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ));
                    return comments(snapshot.data);
                  },
                ),
              ),
              TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: "Post your comment",
                      prefixIcon: Icon(Icons.messenger_outline),
                      labelText: "Comment",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send_rounded),
                        splashColor: Colors.blue,
                        splashRadius: 25.0,
                        onPressed: click,
                      ))),
            ],
          )),
    );
  }
}
