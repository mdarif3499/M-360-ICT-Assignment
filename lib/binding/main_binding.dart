import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../util/user_securce_storage.dart';
import '../view/auth/controller/auth_controller.dart';

class MainBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => FlutterSecureStorage(aOptions: getAndroidOptions()));
    Get.lazyPut(() => UserSecureStorageImpl(Get.find()));
    Get.lazyPut<AuthController>(() => AuthController(Get.find()));

  }

}