import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://img2.baidu.com/it/u=887767646,637468536&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pen',
      description: 'Writing...',
      price: 49.99,
      imageUrl:
          'https://www.montblanc.com/variants/images/34480784411792216/A/w828.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); // 新增商品，products变化，通知listeners变化
  }

  Product findProductById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
