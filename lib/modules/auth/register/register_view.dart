import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/custom_password_field.dart';
import '../../../core/widgets/primary_button.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneFormatter = MaskTextInputFormatter(
      mask: '(###) ###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Join Us!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Create an account to get started.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  labelText: 'Full Name',
                  hintText: 'John Doe',
                  controller: controller.fullNameController,
                  validator: (v) => Validators.validateRequired(v, 'Full Name'),
                  prefixIcon: const Icon(Icons.person),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Email Address',
                  hintText: 'test@example.com',
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  validator: Validators.validateEmail,
                  prefixIcon: const Icon(Icons.email),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Phone Number',
                  hintText: '(123) 456-7890',
                  keyboardType: TextInputType.phone,
                  controller: controller.phoneController,
                  validator: Validators.validatePhone,
                  prefixIcon: const Icon(Icons.phone),
                  inputFormatters: [phoneFormatter],
                ),
                const SizedBox(height: 16),
                CustomPasswordField(
                  labelText: 'Password',
                  controller: controller.passwordController,
                  validator: Validators.validatePassword,
                ),
                const SizedBox(height: 16),
                CustomPasswordField(
                  labelText: 'Confirm Password',
                  controller: controller.confirmPasswordController,
                  validator: (v) => Validators.validateConfirmPassword(
                    v,
                    controller.passwordController.text,
                  ),
                ),
                const SizedBox(height: 32),
                Obx(() => PrimaryButton(
                  text: 'REGISTER',
                  isLoading: controller.isLoading,
                  onPressed: controller.register,
                )),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: controller.goToLogin,
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
