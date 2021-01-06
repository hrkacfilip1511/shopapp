//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopitemapp/pages/checkout_screen.dart';
import 'package:shopitemapp/pages/loading.dart';
import 'povijest_kupnji.dart';
import 'prijatelji.dart';
import 'package:shopitemapp/widgets/sliver_app_bar.dart';
import 'left_drawer.dart';
import 'nova_kupovina.dart';
import 'package:shopitemapp/services/auth.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
 Widget _buildBottomAppBar() {
   return
      BottomAppBar(
       shape: CircularNotchedRectangle(),
       color: Colors.blueGrey,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
           IconButton(
             icon: Icon(
               Icons.history,
               size: 27.0,
               color: Colors.white,
             ),
             onPressed: () {
               Navigator.push(context, MaterialPageRoute(
                 builder: (context) => PovijestKupnji(),
               ));
             },
           ),
           IconButton(
             icon: Icon(
               Icons.home,
               size: 27.0,
               color: Colors.white,
             ),
             onPressed: () {
               Navigator.push(context, MaterialPageRoute(
                 builder: (context) => Home(),
               ));
             },
           ),

         ],
       ),
   );

 }
 Widget _buildFloatingActionBtn() {
   return FloatingActionButton(
     onPressed: () {
       Navigator.push(context, MaterialPageRoute(
         builder: (context) => NovaKupovina(),
       ));
     },
     child: IconButton(
       icon: Icon(
         Icons.shopping_cart,
         color: Colors.white,
       ),
     ),
   );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async{
              await _auth.signOut();
            },
            icon: Icon(
                Icons.exit_to_app,
              color: Colors.white,
            ),
            label: Text('Odjava',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Dobrodošli na aplikaciju',
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
              ],
            ),
            Divider(
              height: 20.0,
              color: Colors.blueGrey[700],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('EasyBuy',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'SansitaSwashed',
                  color: Colors.lightBlueAccent,
                ),
                ),
              ],
            ),
            Divider(
              height: 20.0,
              color: Colors.blueGrey[700],
            ),
          ],
        ),
      ),
      //drawer: LeftDrawer(),
      bottomNavigationBar: _buildBottomAppBar(),
      floatingActionButtonLocation:FloatingActionButtonLocation.endDocked,
      floatingActionButton: _buildFloatingActionBtn(),
    );
  }
}
