import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_yebelo/app/controller/cartController.dart';
import 'package:shop_yebelo/app/ui/responsive/responsive.dart';

class CartListWidget extends StatelessWidget {
  CartListWidget({
    Key? key,
  }) : super(key: key);
  CartController cartData = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtils.horizontalBlockSize * 15,
      width: SizeUtils.horizontalBlockSize * 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.green[100],
      ),
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: cartData.cartList.length,
          itemBuilder: (_, index) {
            return Container(
                height: SizeUtils.horizontalBlockSize * 15,
                width: SizeUtils.horizontalBlockSize * 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(
                          cartData.cartList[index].image.toString()),
                    ),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 15,
                    ),
                    Text(
                      cartData.cartList[index].p_name.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    SizedBox(
                      width: SizeUtils.horizontalBlockSize * 15,
                    ),
                    Text(
                        "\u20b9 ${cartData.cartList[index].p_cost.toString()}"),
                  ],
                ));
          }),
    );
  }
}
