import 'dart:async';
import 'package:account_book/common/values/values.dart';
import 'package:account_book/global.dart';
import 'package:get/get.dart';

import 'local_storage.dart';

/// 检查是否有 token
Future<bool> isAuthenticated() async {
  var profileJSON = LoacalStorage().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJSON != null ? true : false;
}

/// 删除缓存token
Future deleteAuthentication() async {
  await LoacalStorage().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile = null;
}

/// 重新登录
void deleteTokenAndReLogin() async {
  await deleteAuthentication();
  Get.offAndToNamed('/login');
}
