import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../helpers/ApiHandler.dart';
import '../helpers/ErrorHandler.dart';
import '../resources/UrlResources.dart';

class LoginProvider extends ChangeNotifier
{

  bool isLogin=false;
  var message="";
  checkLogin(context,params) async {
    try
    {
      var h = {
        "Content-Type":"application/json"
      };

      await ApiHandler.postRequest(UrlResources.LOGIN, body: jsonEncode(params),headers: h).then((json) async {
        if(json["result"]=="success")
        {
          bool isLogin=true;
          message= json["message"].toString();

        }
        else
        {
          bool isLogin=false;
          message= json["message"].toString();
        }
      });
    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //Navigator.of(context)
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }

}