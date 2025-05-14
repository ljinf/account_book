import 'package:account_book/pages/bill/add/add_bill_controller.dart';
import 'package:get/get.dart';

class AddBillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBillController());
  }
}
