part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + '/login';

    var response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'email': email,
          'password': password,
        },
      )
    );

    if(response.statusCode != 200) {
      return ApiReturnValue(message: 'Login failed, please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['token'];
    User value = User.fromJson(data['data']['token']);

    return ApiReturnValue(value: mockUser);

    // await Future.delayed(Duration(milliseconds: 500));

    // Login Berhasil
    // return ApiReturnValue(value: mockUser);

    // Login Gagal
    // return ApiReturnValue(message: "Email atau password salah");
  }
}
