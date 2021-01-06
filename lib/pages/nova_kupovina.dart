import 'package:flutter/material.dart';
import 'package:shopitemapp/pages/product_screen.dart';
import 'product_model.dart';
import 'checkout_screen.dart';

class NovaKupovina extends StatefulWidget {
  @override
  _NovaKupovinaState createState() => _NovaKupovinaState();
}
class DataSearch extends SearchDelegate<String> {
  final foodstuff = [
    "Kruh",
    "Sol",
    "Secer",
    "Pura",
    "Brasno",
    "Sir",
    "Meso",
    "Mlijeko",
    "Makarone",
    "Riza",
    "Ulje",
    "Majoneza",
    "Kecap",
    "Nutella",
  ];
  final price = [
    10.52,
    2.50,
    1.50,
    2.80,
    10.30,
    2.44,
    1.33,
    2.30,
    1.20,
    20.76,
    10.45,
    20.66,
    11.34,
    9.50,
  ];
  final recentFoodstuff = [
    "Kruh",
    "Sol",
    "Secer",
    "Pura",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = ""; //Briše što smo prethodno kucali
    },)
    ];
  }

  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  Widget buildResults(BuildContext context) {

  }

  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentFoodstuff : foodstuff.where((p) => p.startsWith(query)).toList(); //ako nije prazna trazilica onda mozemo kucati i trazi nam abecednim redom
    return ListView.builder(itemBuilder: (context, index) =>
        ListTile(
          onTap: () {},
          //Metoda koja klikom na neki od ponuđenih namirnica nam pokazuje novi prozor koji smo dobili u buildResults
          leading: FlatButton.icon(
            icon: Icon(
              Icons.add_shopping_cart,
              size: 30.0,
            ),
            onPressed: () {

            },
            label: Text(suggestionList[index],
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold

              ),),
          ),
          trailing: Text('${price[index]}'),
        ),
      itemCount: suggestionList.length,
    );
  }
}
class _NovaKupovinaState extends State<NovaKupovina> {
  List<ProductModel> cart = [];
  double sum = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(

       actions: <Widget>[
         FlatButton.icon(
           color: Colors.white,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(55.0),
           ),
           onPressed: () {
             showSearch(context: context, delegate: DataSearch());//Metoda koja nam omogucava pretrazivanje
           },
           icon: Icon(
             Icons.search,
           ),
           label: Text('Pretraži'),
         ),
       ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Osnovno'),
              Tab(text: 'Odabrano'),
            ],
          ),
          ),
        body: TabBarView(
          children: <Widget>[
            ProductScreen((selectedProduct){
              setState(() {
                cart.add(selectedProduct); //update
                sum = 0;
                cart.forEach((item){
                  sum = sum + item.price;
                });
              });
            }),
            CheckoutScreen(cart, sum),
          ],
        ),
      ),
    );
  }
}
