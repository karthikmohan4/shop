import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_yebelo/app/controller/cartController.dart';
import 'package:shop_yebelo/app/routes/appRoutes.dart';
import 'package:shop_yebelo/app/ui/responsive/responsive.dart';

class OrderPlaced extends StatelessWidget {
  CartController cartData = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return SafeArea(
        child: Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        LottieBuilder.asset("assets/images/success.json"),
        Text("Order Placed Successfully",
            style: TextStyle(
                fontSize: SizeUtils.horizontalBlockSize * 4,
                fontWeight: FontWeight.bold)),
        Text("Amount to be paid:Rs.${cartData.totalPrice}",
            style: TextStyle(
                fontSize: SizeUtils.horizontalBlockSize * 6,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 15,
        ),
        InkWell(
          child: Text("Go to home"),
          onTap: () => Get.offAllNamed(Routes.INITIAL),
        )
      ]),
    ));
  }
}
