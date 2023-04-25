import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/app/modules/home/controllers/home_controller.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final HomeController controller = Get.find();
  ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final products = controller.products;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) {
        return Obx(() => ProductItem(
          id: controller.products[i].id,
          title: controller.products[i].title,
          imageUrl: controller.products[i].imageUrl,
          isFavorite: controller.products[i].isFavorite,
        ));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
