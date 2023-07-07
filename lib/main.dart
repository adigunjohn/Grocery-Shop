import 'package:flutter/material.dart';
import 'package:grocery_shop/homescreen.dart';
import 'package:grocery_shop/shopmodel.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ShopModel>(create: (_) => ShopModel()),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}


