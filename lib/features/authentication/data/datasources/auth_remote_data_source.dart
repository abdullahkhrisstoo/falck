import 'package:falack_app/core/error/exceptions.dart';
import 'package:falack_app/features/authentication/domain/entities/data_test.dart';
import 'package:dio/dio.dart';


abstract class AuthRemoteDataSource {
  Future<AuthUser> login(String email, String password);
  Future<void> register(String email, String password, String phoneNumber);
  Future<void> resetPassword(String email);
  Future<void> otpConfirmEmail(String email, String otp);
  Future<void> otpConfirmPhone(String phoneNumber, String otp);
}



class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<AuthUser> login(String email, String password) async {
    final response = await dio.post('/login', data: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return AuthUser.fromJson(response.data);
    } else {
      throw Exception('Login failed');
    }
  }

  @override
  Future<void> register(String email, String password, String phoneNumber) async {
    final response = await dio.post('/register', data: {
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
    });

    if (response.statusCode != 200) {
      throw Exception('Registration failed');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    final response = await dio.post('/reset-password', data: {
      'email': email,
    });

    if (response.statusCode != 200) {
      throw Exception('Reset password failed');
    }
  }

  @override
  Future<void> otpConfirmEmail(String email, String otp) async {
    final response = await dio.post('/otp-confirm-email', data: {
      'email': email,
      'otp': otp,
    });

    if (response.statusCode != 200) {
      throw Exception('OTP confirmation failed');
    }
  }

  @override
  Future<void> otpConfirmPhone(String phoneNumber, String otp) async {
    final response = await dio.post('/otp-confirm-phone', data: {
      'phone_number': phoneNumber,
      'otp': otp,
    });

    if (response.statusCode != 200) {
      throw Exception('OTP confirmation failed');
    }
  }
}
