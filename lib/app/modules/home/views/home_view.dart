import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop/app/modules/home/widgets/products_grid.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child:ProductsGrid(),
      ),
    );
  }
}
