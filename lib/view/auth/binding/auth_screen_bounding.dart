import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../util/user_securce_storage.dart';
import '../controller/auth_controller.dart';


class AuthScreenBindings extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => FlutterSecureStorage(aOptions: getAndroidOptions()));
     Get.lazyPut(() => UserSecureStorageImpl(Get.find()));
     Get.lazyPut<AuthController>(() => AuthController(Get.find()));
  }
}