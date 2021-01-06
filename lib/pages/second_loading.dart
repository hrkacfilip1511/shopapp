import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopitemapp/signAndregister/wrapper.dart';
import 'home.dart';
class SecondLoading extends StatefulWidget {
  @override
  _SecondLoadingState createState() => _SecondLoadingState();
}

class _SecondLoadingState extends State<SecondLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Center(
        child: SpinKitFadingCircle(
          size: 80.0,
          color: Colors.white,
        ),
      ),
    );
  }

}


