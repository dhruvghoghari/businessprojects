import 'package:flutter/material.dart';
import '../helpers/ApiHandler.dart';
import '../helpers/ErrorHandler.dart';
import '../models/urproduct.dart';
import '../resources/UrlResources.dart';

class GetProduct extends ChangeNotifier
{

  List<urproduct>? allData;

  mainProduct(context) async{
    try
    {
      await ApiHandler.getRequest(UrlResources.Get_Product).then((json){
        allData = json["products"].map<urproduct>((obj) => urproduct.fromJson(obj)).toList();
        notifyListeners();
      });
    }
    on ErrorHandler catch (ex)
    {
      print(ex.message.toString());
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //rdirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }
}