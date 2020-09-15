import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hot_byte_admin/register.dart';
import 'wrapper.dart';
import 'package:hot_byte_admin/wrapper.dart';
import 'signin.dart';
import 'package:provider/provider.dart';
import 'user.dart';

class Loadings extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loadings> {
  void initialiseApp() async {
    await Firebase.initializeApp();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return StreamProvider<Users>.value(
      value: AuthService().user,
          child: MaterialApp(
       home: Wrapper(),
      ),
    );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initialiseApp();
  }

  Widget build(BuildContext context) {
    return Container(

      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
      child: Image(image: AssetImage('assets/hot_byte.jpg'),)
      
    );
  }
}
