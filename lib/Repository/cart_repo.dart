import 'package:dio/dio.dart';

class AddToCartRepo {
  final Dio _dio = Dio();

  Future<Response> postItem(int productId, String? token) async {
    final res = await _dio.post(
      'https://student.valuxapps.com/api/carts',
      options: Options(
        headers: {
          'Authorization':token     
        },
      ),
      data: {
        "product_id": productId,
      },
    );
    print('id products');
    print(res);
    return res;
  }
}
