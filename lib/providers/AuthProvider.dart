import 'dart:convert';
import 'package:businessprojects/helpers/ApiHandler.dart';
import 'package:businessprojects/resources/UrlResources.dart';
import 'package:businessprojects/screens/others/HomePage.dart';
import 'package:businessprojects/screens/others/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/ErrorHandler.dart';

class AuthProvider extends ChangeNotifier
{

  bool islogin=false;
  var loginmessage="";
  checklogin(context,params) async {
    try
    {
      var h = {
        "Content-Type":"application/json"
      };
      
      await ApiHandler.postRequest(UrlResources.LOGIN,body: jsonEncode(params),headers: h).then((json) async {
        if(json["result"]=="success")
          {
            islogin=true;
            loginmessage = json["message"].toString();
            var id = json["data"]["id"].toString();
            var name = json["data"]["name"].toString();
            var email = json["data"]["email"].toString();
            var token = json["data"]["user_session_token"].toString();


            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("islogin", "yes");

            prefs.setString("id", id);
            prefs.setString("name", name);
            prefs.setString("email", email);
            prefs.setString("user_session_token", token);


          }
        else
          {
            islogin=false;
            loginmessage = json["message"].toString();
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