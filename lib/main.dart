import 'package:flutter/material.dart';
import 'package:shopitemapp/signAndregister/wrapper.dart';
import 'package:shopitemapp/signAndregister/user.dart';
import 'package:shopitemapp/services/auth.dart';
import 'package:shopitemapp/pages/home.dart';
import 'package:shopitemapp/pages/loading.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
