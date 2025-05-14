import 'package:flutter/material.dart';
import 'package:account_book/global.dart';
import 'package:account_book/pages/Index/Index_controller.dart';
import 'package:account_book/pages/home/home_view.dart';
import 'package:account_book/pages/login/login_view.dart';
import 'package:account_book/pages/splash/spalsh_view.dart';
import 'package:get/get.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();

    /* return Obx(() => Scaffold(
          body: controller.isloadWelcomePage.isTrue
              ? SplashPage()
              : Global.isOfflineLogin
                  ? HomePage()
                  : LoginPage(),
        ));*/
  }
}
