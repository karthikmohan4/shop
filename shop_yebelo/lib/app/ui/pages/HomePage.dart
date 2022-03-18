import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_yebelo/app/controller/cartController.dart';
import 'package:shop_yebelo/app/data/models/itemList.dart';
import 'package:shop_yebelo/app/data/models/itemsData.dart';
import 'package:shop_yebelo/app/data/models/premiumListData.dart';
import 'package:get/get.dart';
import 'package:shop_yebelo/app/routes/appRoutes.dart';
import 'package:shop_yebelo/app/ui/responsive/responsive.dart';
import 'package:shop_yebelo/app/ui/widgets/itemsListWidgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  CartController cartData = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          minimum: EdgeInsets.fromLTRB(
              SizeUtils.horizontalBlockSize * 5.1,
              SizeUtils.horizontalBlockSize * 10.2,
              SizeUtils.horizontalBlockSize * 5.1,
              0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white24,
                    radius: SizeUtils.horizontalBlockSize * 5,
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                      child: CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    radius: SizeUtils.horizontalBlockSize * 4.5,
                    child: Image.asset("assets/images/cart.png"),
                  )),
                  Obx(
                    () => InkWell(
                      onTap: () => Get.toNamed(Routes.CART),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          height: SizeUtils.horizontalBlockSize * 8,
                          width: SizeUtils.horizontalBlockSize * 16,
                          padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey[300]),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(children: [
                              Icon(
                                Icons.shopping_cart_rounded,
                                size: SizeUtils.horizontalBlockSize * 6,
                              ),
                              (cartData.items! > 9)
                                  ? Text(
                                      "9+",
                                      style: TextStyle(
                                          color: Colors.red[700],
                                          fontSize:
                                              SizeUtils.horizontalBlockSize * 5,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      "${cartData.items.toString()}",
                                      style: TextStyle(
                                          color: Colors.green[700],
                                          fontSize:
                                              SizeUtils.horizontalBlockSize * 5,
                                          fontWeight: FontWeight.w600),
                                    ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 5,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  // /color: Colors.yellow,
                  height: SizeUtils.horizontalBlockSize * 20,
                  width: SizeUtils.horizontalBlockSize * 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "EAT HEALTHY",
                        style: TextStyle(
                            fontSize: SizeUtils.horizontalBlockSize * 6,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " FEEL HEALTHY",
                        style: TextStyle(
                            fontSize: SizeUtils.horizontalBlockSize * 6,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
              ),
              CupertinoSearchTextField(),
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 5,
              ),
              Center(
                child: Container(
                  height: SizeUtils.horizontalBlockSize * 10,
                  width: double.maxFinite,
                  child: TabBar(
                      controller: tabController,
                      isScrollable: true,
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      tabs: const [
                        Tab(text: 'Featured'),
                        Tab(text: 'Premium'),
                        Tab(
                          text: 'Offers',
                        ),
                      ]),
                ),
              ),
              Container(
                height: SizeUtils.horizontalBlockSize * 120,
                child: TabBarView(controller: tabController, children: [
                  ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, index) {
                        return ItemsListWidget(
                          items: items[index],
                        );
                      }),
                  ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                      scrollDirection: Axis.horizontal,
                      itemCount: premiumItems.length,
                      itemBuilder: (_, index) {
                        return ItemsListWidget(items: premiumItems[index]);
                      }),
                  Text('offers')
                ]),
              ),
            ],
          )),
    );
  }
}
