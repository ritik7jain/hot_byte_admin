import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children:<Widget>[ 
          Container(
            width: MediaQuery.of(context).size.width,
            height: 600,
            child:   Image(image: AssetImage('assets/hot_byte.jpg'),)
          ),
          
          SpinKitChasingDots(
          color: Colors.lightBlue[300],
          size: 50.0,
        ),
        ],
      ),
      
    );
  }
}
