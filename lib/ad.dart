
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String text = "Initial Text";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new Container(child: new DrawerHeader(child: new Container())),
              new Container (
                child: new Column(
                    children: <Widget>[
                      new ListTile(
                          leading: new Icon(Icons.select_all, color: Colors.red[900],),
                          title:Text("Okuyucu", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.red[900], fontFamily: 'Signi'),),
                          subtitle: Text("Scanner",style: TextStyle( fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.red[900], fontFamily: 'Signi'),),
                          dense: true,
                          trailing: new Icon(Icons.arrow_forward, color: Colors.red[900],),
                          onTap:(){
                            setState((){

                            });
                            Navigator.pop(context);
                          }
                      ),
                      new ListTile(leading: new Icon(Icons.view_list, color:Colors.red[900]),
                          title:Text("Yoklama Tablosu", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.red[900], fontFamily: 'Signi'),),
                          subtitle: Text("Table",style: TextStyle( fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.red[900], fontFamily: 'Signi'),),
                          dense: true,
                          trailing: new Icon(Icons.arrow_forward, color: Colors.red[900]),
                          onTap:(){
                            setState((){
                              text = "save pressed";

                            });
                            Navigator.pop(context);
                          }
                      ),
                      new ListTile(leading: new Icon(Icons.arrow_back, color:Colors.red[900]),
                          title:Text("Geri", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.0, color: Colors.red[900], fontFamily: 'Signi'),),
                          dense: true,
                          onTap:(){
                            setState((){

                            });
                            Navigator.pop(context);
                          }
                      ),

                    ]
                ),
              )
            ],
          ),
        ),
        appBar: new AppBar(
          backgroundColor: Colors.red[900],
          centerTitle: true,
          title: new Text(
            "QR ADMIN",
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: Colors.grey[200],
                fontFamily: 'Signi'
            ),
          ),
        ),
        body: new Center(child: new Text((text)),
        ));
  }
}