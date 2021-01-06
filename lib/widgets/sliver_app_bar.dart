import 'package:flutter/material.dart';
class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    Key key,
}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(

        background: Image(
          image: AssetImage('assets/shop.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
