import 'package:account_book/pages/bill/list/bill_list_controller.dart';
import 'package:get/get.dart';

class BillListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillListController());
  }
}
