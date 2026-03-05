import '../services/api_service.dart';
import '../models/user_model.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<UserModel> login(String emailOrPhone, String password) async {
    try {
      final response = await _apiService.login({
        'email': emailOrPhone,
        'password': password,
      });
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Failed to login. Please try again.';
    } catch (e) {
      throw 'An unexpected error occurred.';
    }
  }

  Future<String> register(String fullName, String email, String phone, String password) async {
    try {
      final response = await _apiService.register({
        'name': fullName,
        'email': email,
        'phone': phone,
        'password': password,
      });
      return response.data['message'] ?? 'Registration successful';
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Failed to register. Please try again.';
    } catch (e) {
      throw 'An unexpected error occurred.';
    }
  }
}
