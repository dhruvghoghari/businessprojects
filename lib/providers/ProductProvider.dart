import 'package:flutter/material.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/ErrorHandler.dart';
import '../models/Product.dart';
import '../resources/UrlResources.dart';
class ProductProvider extends ChangeNotifier
{
  List<Products>? alldata;

  viewproduct(context) async{
    try
    {
      await ApiHandler.getRequest(UrlResources.ALL_PRODUCT).then((json){
        alldata = json["data"].map<Products>((obj) => Products.fromJson(obj)).toList();
        notifyListeners();
      });
    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //Navigator.of(context)
        //rdirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
      else
      {
        //redirect to support page
      }
    }
  }


  bool isinserted=false;
  var insertmessage="";

  addproduct(context,params) async
  {
    try
    {
      await ApiHandler.postRequest(UrlResources.ADD_PRODUCT,body: params).then((json){
        if(json["status"]=="true")
        {
          insertmessage = json["message"].toString();
          isinserted=true;
        }
        else
        {
          insertmessage = json["message"].toString();
          isinserted=false;
        }
      });
    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //Navigator.of(context)
        //rdirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
      else
      {
        //redirect to support page
      }
    }

  }


}