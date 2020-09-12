import 'package:flutter/material.dart';
import 'signin.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: AppBar(
          title: Text("Welcome to Hot Byte"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("logout"),
              onPressed: () async{
                await _auth.signOut(); 

              },

            ),
          ],
        ),
     
    );
  }
}
