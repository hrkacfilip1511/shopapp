import 'package:shopitemapp/signAndregister/authenticate.dart';
import 'package:shopitemapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shopitemapp/signAndregister/user.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
