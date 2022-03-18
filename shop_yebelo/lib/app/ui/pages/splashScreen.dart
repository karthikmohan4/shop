import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_yebelo/app/routes/appRoutes.dart';
import 'package:shop_yebelo/app/ui/responsive/responsive.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () => Get.offAllNamed(Routes.INITIAL));
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "Welcome to",
        style: TextStyle(
            fontSize: SizeUtils.horizontalBlockSize * 9,
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
      Text(
        "Fruit Market",
        style: TextStyle(
            fontSize: SizeUtils.horizontalBlockSize * 7,
            fontWeight: FontWeight.w700,
            color: Colors.red[700]),
      ),
      SizedBox(height: SizeUtils.horizontalBlockSize * 10),
      Center(
        child: Container(
          height: SizeUtils.horizontalBlockSize * 60,
          width: SizeUtils.horizontalBlockSize * 60,
          child: Lottie.asset('assets/images/cart.json'),
        ),
      ),
      SizedBox(height: SizeUtils.horizontalBlockSize * 10),
      CircularProgressIndicator(
        color: Colors.black,
      )
    ]));
  }
}
