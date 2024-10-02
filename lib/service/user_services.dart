part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + '/login';

    var response = await client.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, String>{
            'email': email,
            'password': password,
          },
        ));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Login failed, please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);

    // await Future.delayed(Duration(milliseconds: 500));

    // Login Berhasil
    // return ApiReturnValue(value: mockUser);

    // Login Gagal
    // return ApiReturnValue(message: "Email atau password salah");
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File? pictureFile, http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + '/register';

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
        'name': user.name,
        'email': user.email,
        'password': password,
        'password_confirmation': password,
        'address': user.address,
        'city': user.city,
        'houseNumber': user.houseNumber,
        'phoneNumber': user.phoneNumber,
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Register failed, please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['token'];
    User value = User.fromJson(data['data']['user']);

    // Upload Picture
    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadPicturePath(pictureFile);
    }

    return ApiReturnValue();
  }

  static Future<ApiReturnValue<String>> uploadPicturePath(File pictureFile,
      {http.MultipartRequest? request}) async {
    String url = baseUrl + '/user/photo';

    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest('POST', uri)
        ..headers['Content-Type'] = 'application/json'
        ..headers['Authorization'] = 'Barer ${User.token}';
    }

    var multiPartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);

    request.files.add(multiPartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();

      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Upload picture failed, please try again');
    }

    return ApiReturnValue();
  }
}
