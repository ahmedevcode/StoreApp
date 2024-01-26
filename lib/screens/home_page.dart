import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/porduct_model.dart';
import 'package:store/screens/categories_page.dart';
import 'package:store/services/get_all_product_services.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                 Navigator.pushNamed(context, CategoriesPage.id);
              },
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
          child: FutureBuilder<List<ProductModel>>(
              future: AllProductService().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData){
                   List<ProductModel> products = snapshot.data!;
                  return GridView.builder(
                    itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 100),
                      itemBuilder: (context, index) {
                        return CustomCard(product: products[index],);
                      });
                }else {
                  return Center(child: CircularProgressIndicator());
                }
              
              
              })),
              
    );
  }
}
