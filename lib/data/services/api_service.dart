import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  // Placeholder Base URL
  static const String baseUrl = 'https://api.example.com';

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Add logging and auth interceptors here if needed
    _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  // Placeholder login method
  Future<Response> login(Map<String, dynamic> data) async {
    // return await _dio.post('/login', data: data);
    
    // Simulating API delay and response for boilerplate
    await Future.delayed(const Duration(seconds: 2));
    if (data['email'] == 'test@test.com' && data['password'] == '123456') {
      return Response(
        requestOptions: RequestOptions(path: '/login'),
        statusCode: 200,
        data: {'token': 'fake_jwt_token', 'user': {'name': 'John Doe', 'email': data['email']}},
      );
    } else {
      throw DioException(
        requestOptions: RequestOptions(path: '/login'),
        response: Response(requestOptions: RequestOptions(path: '/login'), statusCode: 401, data: {'message': 'Invalid credentials. Use test@test.com and 123456.'}),
      );
    }
  }

  // Placeholder register method
  Future<Response> register(Map<String, dynamic> data) async {
    // return await _dio.post('/register', data: data);
    
    // Simulating API delay and response for boilerplate
    await Future.delayed(const Duration(seconds: 2));
    return Response(
      requestOptions: RequestOptions(path: '/register'),
      statusCode: 200,
      data: {'message': 'User registered successfully'},
    );
  }
}
