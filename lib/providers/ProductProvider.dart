import 'package:businessprojects/screens/products/ViewProduct.dart';
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
        //rdirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }



  bool isinserted=false;
  var insertmessage="";
  addproduct(context,params) async{
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
        //rdirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }

  bool isdelete=false;
  deleteproduct(context,params) async{
    try
        {
          await ApiHandler.postRequest(UrlResources.DELETE_PRODUCT,body: params).then((json){
            if(json["status"]=="true")
              {
                isdelete=true;
                viewproduct(context);
              }
            else
              {
                isdelete=false;
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

  Products? singleobj;
  getsingledata(context,params) async{
    try
    {
      await ApiHandler.postRequest(UrlResources.SINGLE_PRODUCT,body: params).then((json){
        if(json["status"]=="true")
          {
            singleobj = Products.fromJson(json["data"]);
            notifyListeners();
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

  var isupdate=false;
  var insertdmessage="";

  updateproduct(context,params)async{
    try
    {
      await ApiHandler.postRequest(UrlResources.UPDATE_PRODUCT,body: params).then((json){
        if(json["status"]=="true")
        {
          insertdmessage = json["message"].toString();
          isupdate=true;
          viewproduct(context);
        }
        else
        {
          insertdmessage = json["message"].toString();
          isupdate=false;
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
    }
  }


}