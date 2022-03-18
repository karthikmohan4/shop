import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_yebelo/app/controller/cartController.dart';
import 'package:shop_yebelo/app/routes/appRoutes.dart';
import 'package:shop_yebelo/app/ui/responsive/responsive.dart';
import 'package:shop_yebelo/app/ui/widgets/cartListWidget.dart';

class CartPage extends StatelessWidget {
  CartController cartData = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(
            SizeUtils.horizontalBlockSize * 5.1,
            SizeUtils.horizontalBlockSize * 10.2,
            SizeUtils.horizontalBlockSize * 5.1,
            0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: SizeUtils.horizontalBlockSize * 12,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: SizeUtils.horizontalBlockSize * 30,
                  ),
                  Center(
                    child: Text(
                      "Cart",
                      style: TextStyle(
                          fontSize: SizeUtils.horizontalBlockSize * 6,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Obx(() => Container(
                height: SizeUtils.horizontalBlockSize * 10,
                width: SizeUtils.horizontalBlockSize * 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green[100],
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Total Items :${cartData.items.toString()}",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: SizeUtils.horizontalBlockSize * 5,
                        fontWeight: FontWeight.w600),
                  ),
                ))),
            SizedBox(
              height: SizeUtils.horizontalBlockSize * 5,
            ),
            Container(
              height: SizeUtils.horizontalBlockSize * 120,
              width: double.maxFinite,
              child: CartListWidget(),
            ),
            Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtils.horizontalBlockSize * 5),
                ),
                (cartData.totalPrice! <= 0)
                    ? Text("\u20B9 0",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeUtils.horizontalBlockSize * 5))
                    : Text("\u20B9 ${cartData.totalPrice}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeUtils.horizontalBlockSize * 5))
              ],
            ),
            (cartData.items! <= 0)
                ? Container()
                : ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.ORDERPLACED);
                    },
                    child: Text("Checkout"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
