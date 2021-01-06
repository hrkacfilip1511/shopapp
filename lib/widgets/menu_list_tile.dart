import 'package:flutter/material.dart';
import 'package:shopitemapp/pages/form_account.dart';
class MenuListTile extends StatefulWidget {
  @override
  _MenuListTileState createState() => _MenuListTileState();
}

class _MenuListTileState extends State<MenuListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: FlatButton.icon(
            icon: Icon(
              Icons.security,
            ),
            onPressed: () {},
            label: Text('Sigurnost'),
          ),
        ),
        ListTile(
          leading: FlatButton.icon(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {},
            label: Text('Postavke'),
          ),

        ),
        ListTile(
          leading: FlatButton.icon(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {},
            label: Text('Obavijesti'),
          ),

        ),
        ListTile(
          leading: FlatButton.icon(
            icon: Icon(
              Icons.help_outline,
            ),
            onPressed: () {},
            label: Text('Pomoć'),
          ),

        ),
        ListTile(
          leading: FlatButton.icon(
            icon: Icon(
              Icons.info_outline,
            ),
            onPressed: () {},
            label: Text('Informacije'),

          ),

        ),
        ListTile(
          leading: FlatButton.icon(
            icon: Icon(
              Icons.bookmark,
            ),
            onPressed: () {},
            label: Text('Označeno'),
          ),

        ),
        Divider(
          height: 50.0,
          color: Colors.blueGrey[700],
        ),
        ListTile(
          leading: FlatButton.icon(
            icon: Icon(
              Icons.exit_to_app,
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => FormAccount(),
              ));
            },
            label: Text('Odjava'),
          ),

        ),
      ],
    );
  }
}
