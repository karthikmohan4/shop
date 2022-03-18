import 'package:get/get.dart';
import 'package:shop_yebelo/app/controller/cartController.dart';

class CartBinding extends Bindings {
  @override 
  void dependencies(){
    Get.lazyPut<CartController>(() => CartController());
  }
}
