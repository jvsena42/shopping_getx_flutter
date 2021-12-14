import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shopping_getx_flutter/screens/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Getx Shopping',
      theme: ThemeData(
        primarySwatch: Colors.red,
          accentColor: Colors.deepOrange,
          fontFamily: "Lato"
      ),
      home: ProductOverviewPage(),
    );
  }
}
