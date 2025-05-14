import 'package:account_book/pages/Index/Index_view.dart';
import 'package:account_book/pages/bill/add/add_bill_binding.dart';
import 'package:account_book/pages/bill/add/add_bill_view.dart';
import 'package:account_book/pages/home/home.binding.dart';
import 'package:account_book/pages/home/home_view.dart';
import 'package:account_book/pages/login/login_binding.dart';
import 'package:account_book/pages/login/login_view.dart';
import 'package:account_book/pages/notfound/notfound_view.dart';
import 'package:account_book/pages/proxy/proxy_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Index;

  static final routes = [
    GetPage(
      name: AppRoutes.Index,
      page: () => IndexPage(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.AddBill,
      page: () => AddBillPage(),
      binding: AddBillBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundPage(),
  );

  static final proxyRoute = GetPage(
    name: AppRoutes.Proxy,
    page: () => ProxyPage(),
  );
}
