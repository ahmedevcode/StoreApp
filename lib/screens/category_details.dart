import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/porduct_model.dart';
import 'package:store/services/all_categories_Services.dart';
import 'package:store/services/get_all_product_services.dart';
import 'package:store/widgets/custom_cateegory.dart';
import 'package:store/widgets/custom_categories.dart';
import 'package:store/services/categories_services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/custom_card.dart';

class CategoriesPagedetails extends StatefulWidget {
  CategoriesPagedetails({super.key, required this.categoryName});
  static String id = "CategoriesPagedetails";
  final String categoryName;

  @override
  State<CategoriesPagedetails> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPagedetails> {
  bool isloading = false;

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
      body:
          Padding(
            padding: const EdgeInsets.only(top: 80, right: 15, left: 15),
            child: FutureBuilder<List<ProductModel>>(
                future: CategoriesServices()
                    .getCategoriesProduct(categoryName: widget.categoryName),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic> categories = snapshot.data!;
                    return GridView.builder(
                        itemCount: categories.length,
                        clipBehavior: Clip.none,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 100),
                        itemBuilder: (context, index) {
                          return Customcatettegory(
                            category: categories[index],
                          );
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        
      );
  }
}
