import 'package:get/get.dart';
import '../models/product.dart';

class HomeController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    products.value = [
      Product(
        id: 'p1',
        title: 'Red Shirt',
        description: 'A red shirt - it is pretty red!',
        price: 29.99,
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        isFavorite: false,
      ),
      Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl:
            'https://img2.baidu.com/it/u=887767646,637468536&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
        isFavorite: false,
      ),
      Product(
        id: 'p3',
        title: 'Yellow Scarf',
        description: 'Warm and cozy - exactly what you need for the winter.',
        price: 19.99,
        imageUrl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
        isFavorite: false,
      ),
      Product(
        id: 'p4',
        title: 'A Pen',
        description: 'Writing...',
        price: 49.99,
        imageUrl:
            'https://www.montblanc.com/variants/images/34480784411792216/A/w828.jpg',
        isFavorite: false,
      ),
    ];
  }

  void toggleFavorite(String id) {
    int idx = products.indexWhere((element) => element.id == id);
    products[idx].isFavorite = !products[idx].isFavorite;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
