import 'package:get/get.dart';

import '../../../model/bill_record_response.dart';

class AddBillController extends GetxController {

  BillRecordModel? recordModel;

  @override
  void onInit() {
    recordModel=Get.arguments['bill'];
    super.onInit();
  }
}
