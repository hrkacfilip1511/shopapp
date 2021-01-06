import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopitemapp/services/database.dart';
import 'package:shopitemapp/pages/product_model.dart';
class CheckoutScreen extends StatelessWidget {
 // CheckoutScreen({this.app});
  //final FireBaseApp app;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  final cart;
  final sum;
  CheckoutScreen(this.cart, this.sum);
  @override
  Widget build(BuildContext context) {

    return  Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView.separated(
            itemBuilder: (context, index)
            {

              return ListTile(

                  title: Text(cart[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  ),
                  trailing: Text("${cart[index].price} KM",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),

              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: cart.length,
            shrinkWrap: true, //prikazuje nam artikle koje smo odabrali
          ),
          Divider(color: Colors.red,),
          Center(
            child: Text("Iznos Vašeg računa: $sum KM",
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Colors.red,
          ),
          SizedBox(
            height: 20.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(

                color: Colors.green,
                onPressed: () async{

                },
                child: Text('Spremi',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
                ),
                ),
              ),
              RaisedButton(

                color: Colors.grey[800],
                onPressed: () {

                },
                child: Text('Izbriši',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),

              ),
            ],
          )
        ],

      ),
    );
  }
}
