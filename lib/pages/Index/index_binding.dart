import 'package:account_book/pages/Index/Index_controller.dart';
import 'package:get/get.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndexController>(() => IndexController());
  }
}
