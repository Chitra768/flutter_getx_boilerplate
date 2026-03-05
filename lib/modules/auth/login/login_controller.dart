import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository;
  
  LoginController(this._authRepository);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        _isLoading.value = true;
        // The mock backend requires test@test.com / 123456
        final user = await _authRepository.login(
          emailController.text.trim(),
          passwordController.text,
        );
        
        Get.snackbar(
          'Success',
          'Welcome back, ${user.name ?? "User"}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        
        Get.offAllNamed(Routes.HOME);
      } catch (e) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        _isLoading.value = false;
      }
    }
  }

  void goToRegister() {
    Get.toNamed(Routes.REGISTER);
  }
}
