import 'package:dio/dio.dart';
import 'package:task/models/category_item.dart';

class CategoryRepo {
  Future<CategoryMdel> getCategory() async {
    var response = await Dio().get(
        'https://student.valuxapps.com/api/categories');



  var categoyModel = CategoryMdel.fromJson(response.data);




  return categoyModel;
  }



}


