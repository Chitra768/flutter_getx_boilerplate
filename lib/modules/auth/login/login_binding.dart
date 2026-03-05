import 'package:get/get.dart';
import '../../../data/services/api_service.dart';
import '../../../data/repository/auth_repository.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<AuthRepository>(() => AuthRepository(Get.find<ApiService>()));
    Get.lazyPut<LoginController>(() => LoginController(Get.find<AuthRepository>()));
  }
}
