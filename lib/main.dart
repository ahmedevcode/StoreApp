import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store/screens/categories_page.dart';
import 'package:store/screens/category_details.dart';
import 'package:store/services/update_product.dart';

import 'screens/home_page.dart';
import 'screens/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id : (context) => HomePage(),
        CategoriesPage.id : (context) => CategoriesPage(),
        UpdateProductPage.id :(context) => UpdateProductPage(),
      
      },
      initialRoute: HomePage.id,
    );
  }
}