import 'package:shopitemapp/pages/loading.dart';
import 'package:shopitemapp/services/auth.dart';
import 'package:flutter/material.dart';
class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({ this.toggleView });
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String username = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(

      appBar: AppBar(
        title: Text('Prijava'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text('Registracija',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: _formKey,
            child: Column(

              children: <Widget>[
                TextFormField(
                  // validator: (val) => val.isEmpty || val.length < 4 ? 'Unesi korisnicko ime (minimalno 4 znaka)' : null,
                    decoration: InputDecoration(
                        labelText: 'Korisnicko ime'
                    ),
                    onChanged: (val) {
                      setState(() => username = val);
                    }
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  //validator: (val) =>  val.length < 5 ? 'Unesi lozinku (minmalno 5 znakova)' : null,
                    decoration: InputDecoration(
                        labelText: 'Lozinka'
                    ),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    }
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                    color: Colors.blue,
                    child: Text('Prijavi se',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithUserNameAndPassword(
                            username, password);
                        if (result == null) {
                          setState(() {
                            error = 'Neuspjela prijava';
                            loading = false;
                          });

                        }
                      }
                    }
                ),
                SizedBox(height: 20.0,),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0,
                  ),
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
