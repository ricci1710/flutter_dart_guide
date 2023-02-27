import 'package:flutter/material.dart';

import './screens/products_overview_screen.dart';

class Section8MainApp extends StatelessWidget {
  const Section8MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShop',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductsOverviewScreen(),
    );
  }
}
