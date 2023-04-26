import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app/modules/home/controllers/home_controller.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: controller.products.length,
        itemBuilder: (ctx, i) {
          return ProductItem(
            id: controller.products[i].id,
            title: controller.products[i].title,
            imageUrl: controller.products[i].imageUrl,
            isFavorite: controller.products[i].isFavorite,
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      );
    });
  }
}
