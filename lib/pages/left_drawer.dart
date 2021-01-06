import 'package:flutter/material.dart';
import 'package:shopitemapp/widgets/menu_list_tile.dart';
class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Center(
              child: Text('username',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                backgroundColor: Colors.black,
                letterSpacing: 1.0,
              ),
              ),
            ),
          otherAccountsPictures: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/shop.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),
          MenuListTile(),
        ],
      ),
    );
  }
}
