import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('MyShop'), actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                  value: FilterOptions.Favorites,
                  child: Text('Only Favorites')),
              const PopupMenuItem(
                  value: FilterOptions.All, child: Text('Show All'))
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
          ),
        ]),
        body: ProductsGrid(_showOnlyFavorites));
  }
}
