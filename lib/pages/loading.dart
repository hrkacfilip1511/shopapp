import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopitemapp/signAndregister/wrapper.dart';
import 'home.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
//  void initState() {
//    super.initState();
//    Future.delayed(Duration(seconds: 3),(){
//      Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper())); //Cekamo 3 sekunde da nam udje u Home page
//    },);
//  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Center(
      child: SpinKitWave(
        size: 80.0,
        color: Colors.white,
      ),
      ),
    );
  }

}
