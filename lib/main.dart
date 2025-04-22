import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:account_book/common/langs/translation_service.dart';
import 'package:account_book/global.dart';
import 'package:account_book/pages/Index/Index_view.dart';
import 'package:account_book/pages/Index/index_binding.dart';
import 'package:account_book/router/app_pages.dart';
import 'package:get/get.dart';

void main() => Global.init().then((e) {
      //透明状态栏
      if (Platform.isAndroid) {
        SystemUiOverlayStyle systemUiOverlayStyle =
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }

      runApp(MyApp());
    });

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter With GetX',
      home: const IndexPage(),
      initialBinding: IndexBinding(),
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      builder: EasyLoading.init(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
    );
  }
}
