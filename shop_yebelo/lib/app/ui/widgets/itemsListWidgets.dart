import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_yebelo/app/controller/cartController.dart';
import 'package:shop_yebelo/app/data/models/itemList.dart';
import 'package:shop_yebelo/app/data/models/itemsData.dart';
import 'package:shop_yebelo/app/ui/responsive/responsive.dart';

class ItemsListWidget extends StatelessWidget {
  ItemsListWidget({Key? key, required this.items}) : super(key: key);
  ItemList items;
  CartController cart = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: SizeUtils.horizontalBlockSize * 30,
            width: SizeUtils.horizontalBlockSize * 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 8,
                ),
                Text(
                  items.p_details.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtils.horizontalBlockSize * 4),
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 8,
                ),
                Container(
                  height: SizeUtils.horizontalBlockSize * 50,
                  width: SizeUtils.horizontalBlockSize * 50,
                  child: CircleAvatar(
                    radius: SizeUtils.horizontalBlockSize * 20,
                    backgroundImage: NetworkImage(items.image!),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                items.p_name.toString().toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        SizeUtils.horizontalBlockSize * 5),
                              ),
                              Text(
                                "\u20B9 ${items.p_cost.toString()}/Kg",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        SizeUtils.horizontalBlockSize * 4),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          cart.decrement(items.p_id!, items.p_cost!,
                              items.image!, items.p_name!, items.p_details!);
                        },
                        icon: Icon(Icons.remove)),

                    InkWell(
                      onTap: () => cart.increment(items.p_id!, items.p_cost!,
                          items.image!, items.p_name!, items.p_details!),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: CircleAvatar(
                          radius: SizeUtils.horizontalBlockSize * 7,
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                            Icons.add,
                            size: SizeUtils.horizontalBlockSize * 8,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: SizeUtils.horizontalBlockSize * 9,
                    //   width: SizeUtils.horizontalBlockSize * 12,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       // cart.addItems(items.p_id!, items.p_cost!, items.image!,
                    //       //     items.p_name!, items.p_details!);
                    //       cart.increment(items.p_id!, items.p_cost!,
                    //           items.image!, items.p_name!, items.p_details!);
                    //     },
                    //     child: FittedBox(
                    //       fit: BoxFit.scaleDown,
                    //       alignment: Alignment.center,
                    //       child: Icon(
                    //         Icons.add_outlined,
                    //         size: SizeUtils.horizontalBlockSize * 14,
                    //       ),
                    //     ),
                    //     style: ElevatedButton.styleFrom(
                    //       primary: Colors.grey,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ],
            )));
  }
}
