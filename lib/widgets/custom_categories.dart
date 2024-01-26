import 'package:flutter/material.dart';
import 'package:store/models/porduct_model.dart';
import 'package:store/screens/category_details.dart';
import 'package:store/screens/update_product.dart';

import '../screens/categories_page.dart';

class CustomCardCtegories extends StatelessWidget {
  CustomCardCtegories({
    required this.category,
    Key? key,
  }) : super(key: key);
  dynamic category;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) =>  CategoriesPagedetails(categoryName: category.toString(),)));
      },
      child: Container(
        child: Column(
          children: [
            Text(
              (category.toString()),style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
