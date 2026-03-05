import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../routes/app_routes.dart';

class RegisterController extends GetxController {
  final AuthRepository _authRepository;

  RegisterController(this._authRepository);

  final formKey = GlobalKey<FormState>();
  
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      try {
        _isLoading.value = true;
        
        final message = await _authRepository.register(
          fullNameController.text.trim(),
          emailController.text.trim(),
          phoneController.text.trim(),
          passwordController.text,
        );

        Get.snackbar(
          'Success',
          message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Go back to login after successful register
        Get.offAllNamed(Routes.LOGIN);
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

  void goToLogin() {
    Get.back();
  }
}
