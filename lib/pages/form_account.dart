import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopitemapp/widgets/password_field.dart';
class FormAccount extends StatefulWidget {
  @override
  _FormAccountState createState() => _FormAccountState();
}
  class Account {
    String username;
    String password;
  }
class _FormAccountState extends State<FormAccount> {
  bool _rememberMe = false;

  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
    String _validateUsername(String value) {
      return value.isEmpty ? 'Unesite korisničko ime' : null;
    }
    void _submitAccount() {
      if(_formStateKey.currentState.validate()){
        _formStateKey.currentState.save();
      }
    }
   Widget _buildSignOrRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        RaisedButton(
          child: Text('Prijavi se',
            style: TextStyle(
              color: Colors.white,
            ),),
          onPressed: () => _submitAccount,
          color: Colors.indigo,
        ),
        SizedBox(width: 25.0,),
        RaisedButton(
          child: Text('Registriraj se',
            style: TextStyle(
              color: Colors.white,
            ),),
          onPressed: () {},
          color: Colors.blue,
        )
      ],
    );
   }
  Widget _buildCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: _rememberMe,
          activeColor: Colors.white,
          checkColor: Colors.green,

          onChanged: (value){
            setState(() {
              _rememberMe = value;
            });
          },
        ),
        Text('Zapamti me',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0
        ),
        ),
      ],
    );
  }
  Widget _buildForgotPassBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text('Zaboravili ste lozinku?',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
  Account _account = Account();
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: Card(
         color: Colors.white30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formStateKey,
                autovalidate: true,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Korisničko ime',
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        validator: (value) => _validateUsername(value),
                        onSaved: (value) => _account.username,
                      ),
                      PasswordField(
                        controller: _passwordController,
                      ),
                      SizedBox(height: 10.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildForgotPassBtn(),
                          _buildCheckBox(),
                          _buildSignOrRegister(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    ),);
  }
}
