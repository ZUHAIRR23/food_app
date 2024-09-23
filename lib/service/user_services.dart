part of 'services.dart';

class UserServices{
  static Future<ApiReturnValue<User>> signIn(String email, String password) async {
    await Future.delayed(Duration(milliseconds: 500));

    // Login Berhasil
    return ApiReturnValue(value: mockUser);

    // Login Gagal
    // return ApiReturnValue(message: "Email atau password salah");
  }
}