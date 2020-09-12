import 'screentest.dart';
import 'package:flutter/material.dart';
import 'authenticate.dart';
import 'package:provider/provider.dart';
import 'user.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return home or authenticate
    final user = Provider.of<Users>(context);
    if (user==null){
      return Authenticate();
    }
    else{
      return Menu();
    }
    

  }
}