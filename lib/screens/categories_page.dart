import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/porduct_model.dart';
import 'package:store/services/all_categories_Services.dart';
import 'package:store/services/get_all_product_services.dart';
import 'package:store/widgets/custom_categories.dart';

import '../widgets/custom_card.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});
  static String id = "CategoriesPage";
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.grey,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "New Trend",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 80, right: 15, left: 15),
          child: FutureBuilder<List<dynamic>>(
              future: AllCategoriesServices().getAllCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData){
                   List<dynamic> categories = snapshot.data!;
                  return GridView.builder(
                    itemCount: categories.length,
                      clipBehavior: Clip.none,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 100),
                      itemBuilder: (context, index) {
                        return CustomCardCtegories(category: categories[index], );
                      });
                }else {
                  return Center(child: CircularProgressIndicator());
                }
              
              
              })),
              
    );
  }
}