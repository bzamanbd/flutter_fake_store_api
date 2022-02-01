import 'package:flutter/material.dart';
import '../screens/products_overview_screen.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  final String _title='Fake Store Api';
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: const ProductsOverviewScreen(),
    );
  }
}
