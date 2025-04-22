import 'package:account_book/pages/bill/search/bill_search_controller.dart';
import 'package:get/get.dart';

class BillSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillSearchController());
  }
}
