import 'package:get/get.dart';
import 'package:shop_yebelo/app/data/models/itemList.dart';

class CartController extends GetxController {
  RxInt? items = 0.obs;
  RxInt? price = 0.obs;
  final cartList = <ItemList>[].obs;
  RxInt? totalPrice = 0.obs;
  ItemList? cartData;
  bool isAdd = false;

  void addItems(int id, int amount, String image, String name, String details) {
    items!.value += 1;
    price!.value = amount.toInt() * items!.value;

    cartList.add((ItemList(
        p_name: name,
        p_id: id,
        p_cost: amount,
        p_availability: 0,
        p_details: details,
        p_category: "",
        image: image)));
  }

  void increment(
      int id, int amount, String image, String name, String details) {
    items!.value += 1;
    print(items!.value);
    price!.value = amount.toInt() * items!.value;
    print(price!.value);
    TotalPrice(amount, "YES");
    if (!cartList.contains(id)) {
      cartList.add((ItemList(
          p_name: name,
          p_id: id,
          p_cost: amount,
          p_availability: 0,
          p_details: details,
          p_category: "",
          image: image)));
    }
  }

  void decrement(
      int id, int amount, String image, String name, String details) {
    (items!.value <= 0)
        ? Get.snackbar("Cart", "items can't be less than 0")
        : items!.value -= 1;
    price!.value = amount.toInt() * items!.value;
    TotalPrice(amount, "NO");
    (items!.value <= 0)
        ? cartList.removeRange(0, cartList.length)
        : cartList.removeLast();
  }

  void TotalPrice(int amount, String operation) {
    if (operation == "NO") {
      totalPrice!.value -= amount;
    } else {
      totalPrice!.value += amount;
    }
  }
}
