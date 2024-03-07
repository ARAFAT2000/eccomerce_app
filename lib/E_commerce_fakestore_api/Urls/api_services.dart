import 'dart:convert';
import 'dart:html';

import 'package:eccomerce_app/E_commerce_fakestore_api/Urls/all_urls.dart';

import '../model/catagory_list_model.dart';
import '../model/productsmodel.dart';
import 'package:http/http.dart'as http;

import '../model/signle_data_model.dart';

class ApiServices{

/// all products api

  Future<List<ProductsModel>> getAllProducts ()async{
    final response= await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if(response.statusCode==200){
      ///map akare o kra jay
      ///ata list type
     return List<ProductsModel>.from(json.decode(response.body).map((x)=> ProductsModel.fromJson(x)));
      
    }else{
      throw Exception('Wait');
    }
  }

/// single data api
  Future<SingleDataModel> getSingleProduct (String productId)async{
    final response= await http.get(Uri.parse('https://fakestoreapi.com/products/${productId}'));
   var data  = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      ///map akare o kra jay
      ///ata list type
      return SingleDataModel.fromJson(data);

    }else{
      throw Exception('Wait');
    }
  }

///catagories
  Future<dynamic> getAllCatagory ()async{
    final response= await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));

    if(response.statusCode==200){
      ///map akare o kra jay
      ///ata list type
      return jsonDecode(response.body.toString());

    }else{
      throw Exception('Wait');
    }
  }

  ///catagory  list model

  Future<List<CatagorylistModel>> getCatagoryList (String catagoryname)async{
    final response= await http.get(Uri.parse('https://fakestoreapi.com/products/category/$catagoryname'));
    if(response.statusCode==200){
      ///map akare o kra jay
      ///ata list type
      return List<CatagorylistModel>.from(json.decode(response.body).map((x)=> CatagorylistModel.fromJson(x)));

    }else{
      throw Exception('Wait');
    }
  }

}