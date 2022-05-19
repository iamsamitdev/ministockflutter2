import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ministock/models/NewsModel.dart';
import 'package:ministock/models/NewsDetailModel.dart';
import 'package:ministock/models/UserModel.dart';
import 'package:ministock/utils/constants.dart' as Constants;
import 'package:ministock/models/ProductModel.dart';

class CallAPI {

  // กำหนด header ของ api
  _setHeaders() => {
    'Content-Type':'application/json',
    'Accept': 'application/json'
  };

  // Read News อ่านข่าวทั้งหมด
  Future<List<NewsModel>> getAllNews() async {
    final response = await http.get(
      Uri.parse(Constants.baseAPIURL+'news'),
      headers: _setHeaders()
    );
    if(response.body != null){
      return newsModelFromJson(response.body);
    }else{
      return null;
    }
  }

  // Read News อ่าน 5 ข่าวล่าสุด
  Future<List<NewsModel>> getLastNews() async {
    final response = await http.get(
      Uri.parse(Constants.baseAPIURL+'lastnews'),
      headers: _setHeaders()
    );
    if(response.body != null){
      return newsModelFromJson(response.body);
    }else{
      return null;
    }
  }


  // Read News by ID หน้ารายละเอียดข่าว
  Future<NewsDetailModel> getNewsByID(id) async {
    final response = await http.get(
      Uri.parse(Constants.baseAPIURL+'news/'+id),
      headers: _setHeaders()
    );
    if(response.body != null){
      return newsDetailModelFromJson(response.body);
    }else{
      return null;
    }
  }

  // Login API
  loginAPI(data) async {
    return await http.post(
      Uri.parse(Constants.baseAPIURL+'login'),
      body: jsonEncode(data),
      headers: _setHeaders()
    );
  }


  // Read User Profile
  Future<UserModel> getProfile(id) async {

    final response = await http.get(
      Uri.parse(Constants.baseAPIURL+'users/'+id),
      headers: _setHeaders()
    );

    if(response.body != null){
      return userModelFromJson(response.body);
    }else{
      return null;
    }

  }

  // ------------------------------------------------
  // ส่วนของการ CRUD Product
  // ------------------------------------------------
  // Get All Products
  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(
      Uri.parse(Constants.baseAPIURL+'products'),
      headers: _setHeaders()
    );

    if(response.statusCode == 200){
      return productModelFromJson(response.body);
    }else{
      return null;
    }
  }

  // Create Products
  Future<bool> createProduct(ProductModel data) async {
    final response = await http.post(
      Uri.parse(Constants.baseAPIURL + "products"),
      headers: _setHeaders(),
      body: productModelToJson(data)
    );

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }

  }

  // Update Products
  Future<bool> updateProduct(ProductModel data) async {
    final response = await http.put(
      Uri.parse(Constants.baseAPIURL + "products/${data.id}"),
      headers: _setHeaders(),
      body: productModelToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // Delete Products
  Future<bool> deleteProduct(String id) async {
    final response = await http.delete(
       Uri.parse(Constants.baseAPIURL + "products/$id"),
      headers: _setHeaders()
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


}