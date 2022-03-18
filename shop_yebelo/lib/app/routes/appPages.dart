import 'package:get/get.dart';
import 'package:shop_yebelo/app/bindings/cartBindings.dart';
import 'package:shop_yebelo/app/routes/appRoutes.dart';
import 'package:shop_yebelo/app/ui/pages/HomePage.dart';
import 'package:shop_yebelo/app/ui/pages/cartPage.dart';
import 'package:shop_yebelo/app/ui/pages/orderPlacedPage.dart';
import 'package:shop_yebelo/app/ui/pages/splashScreen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
    ),
    GetPage(
        name: Routes.INITIAL, page: () => HomePage(), binding: CartBinding()),
    GetPage(name: Routes.CART, page: () => CartPage()),
    GetPage(name: Routes.ORDERPLACED, page: () => OrderPlaced())
  ];
}
