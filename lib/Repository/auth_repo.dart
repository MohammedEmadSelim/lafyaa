import 'package:dio/dio.dart';

class LoginClass {
  final _dio = Dio();

  Future<Response> loginFun(String email, String pass) async {
    final res = await _dio.post(
      'https://student.valuxapps.com/api/login',
      data : {
        "email": email,
        "password": pass,
      },
    );
    return res;
  }
}

// void main(List<String> args) {
//   LoginClass().loginFun('lmlo', 'pass');
// }
