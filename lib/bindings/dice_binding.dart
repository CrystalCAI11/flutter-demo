import '../controllers/dice_controller.dart';
import 'package:get/get.dart';

class DiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiceController());
  }
}
