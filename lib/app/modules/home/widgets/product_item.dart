import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ProductItem extends StatelessWidget {
  final HomeController controller = Get.find();
  final String id;
  final String title;
  final String imageUrl;
  bool isFavorite;

  ProductItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              controller.toggleFavorite(id);
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => {},
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
