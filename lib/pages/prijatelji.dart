import 'package:flutter/material.dart';
import 'home.dart';
import 'povijest_kupnji.dart';
import 'nova_kupovina.dart';
class Prijatelji extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text('Vaši omiljeni kontakti'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
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
            IconButton(
              icon: Icon(
                Icons.favorite,
                size: 27.0,
                color: Colors.redAccent,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Prijatelji(),
                ));
              },
            ),
          ],
        ),
      ),

      floatingActionButtonLocation:FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
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
      ),
    );
  }
}
