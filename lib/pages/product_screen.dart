import 'package:flutter/material.dart';
import 'product_model.dart';
import 'package:shopitemapp/signAndregister/user.dart';
import 'package:provider/provider.dart';
class ProductScreen extends StatelessWidget {
  final ValueSetter<ProductModel> _valueSetter;

  ProductScreen(this._valueSetter); //konstruktor

  List<ProductModel> products = [
    ProductModel("Kruh", 2.00),
    ProductModel("Mlijeko", 2.10),
    ProductModel("Secer", 19.80),
    ProductModel("Pura", 2.20),
    ProductModel("Meso", 14.76),
    ProductModel("Makarone", 1.95),
    ProductModel("Nutella", 6.52),
    ProductModel("Brasno", 21.40),
  ];
  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      itemBuilder: (context, index){

        return  ListTile(
            title: Text(products[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            trailing: Text("${products[index].price} KM",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              _valueSetter(products[index]);
            },
          );
      },
      separatorBuilder: (context, index){
        return Divider(
        );
      },
      itemCount: products.length,
    );
  }
}
