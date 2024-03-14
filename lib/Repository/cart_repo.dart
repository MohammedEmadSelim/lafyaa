import 'package:dio/dio.dart';

class AddToCartRepo {
  Future<Response?> postItem(int productId, String? token) async {
    final Dio _dio = Dio();

    try {
      final res = await _dio.post(
        'https://student.valuxapps.com/api/carts',
        options: Options(
          headers: {'Authorization': token},
        ),
        data: {
          "product_id": productId,
        },
      );

      print('id products');
      print(res);
      return res;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError){
        print('kjvcfcgvhjhkljhkgjhfxgdfchvjkhl');
      }
     return null;
    }
  }
}
