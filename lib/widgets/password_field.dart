import 'package:flutter/material.dart';
class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({
    Key key,
    @required this.controller,
  }) : assert(controller != null),
        super(key: key);
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'Lozinka',
        labelStyle: TextStyle(
          fontSize: 20.0,
        ),
        suffixIcon: GestureDetector(
          child: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
          ),
          onTap: () {
            setState(() {
              _showPassword = !_showPassword; //klikom na ikonu daje suprotnu vrijednost
            });
          },
        ),
      ),
      obscureText: !_showPassword,
      validator: (String value){
        if(value.isEmpty){
          return 'Unesite lozinku';
        }
      },
    );;
  }
}
