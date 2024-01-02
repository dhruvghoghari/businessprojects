import 'package:businessprojects/screens/others/NoInternet.dart';
import 'package:flutter/material.dart';
import '../helpers/ApiHandler.dart';
import '../helpers/ErrorHandler.dart';
import '../models/Employee.dart';
import '../resources/UrlResources.dart';

class EmployeeProvider extends ChangeNotifier
{

  List<Employee>? ealldata;

   viewemplyee(context) async{
    try
        {
          await ApiHandler.getRequest(UrlResources.All_Employee).then((json){
            ealldata = json["data"].map<Employee>((obj) => Employee.fromJson(obj)).toList();
            notifyListeners();
          });
        }
    on ErrorHandler catch (ex)
    {
      print(ex.message.toString());
      if(ex.message.toString()=="Internet Connection Failure")
      {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoInternet())
        );
        //rdirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }

  bool isisnted=false;
   var isntedmessage="";
   addemployee(context,params) async{
    try
        {
          await ApiHandler.postRequest(UrlResources.Add_Employee,body: params).then((json){
            if(json["status"]=="true")
            {
              isntedmessage = json["message"].toString();
              isisnted=true;
            }
            else
            {
              isntedmessage = json["message"].toString();
              isisnted=false;
            }
          });
        }
    on ErrorHandler catch (ex)
    {
      print(ex.message.toString());
      if(ex.message.toString()=="Internet Connection Failure")
      {
        Text("No Internat");
        //rdirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }

  }


  var isdelete=false;
   var deletemsg="";
  Deleteemployee(context,parms) async{
    try
        {
          await ApiHandler.postRequest(UrlResources.Delete_Employee,body: parms).then((json) async{
            if(json["status"]=="true")
              {
                deletemsg= json["message"].toString();
                isdelete=true;
                 viewemplyee(context);
              }
            else
              {
                deletemsg= json["message"].toString();
                isdelete=false;
              }
          });
        }
    on ErrorHandler catch (ex)
    {
      print(ex.message.toString());
      if(ex.message.toString()=="Internet Connection Failure")
      {
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => NoInternet())
        // );
        //rdirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }


  var isupdate=false;
  var insertdmessage="";

  updateEmployee(context,params)async{
    try
    {
      await ApiHandler.postRequest(UrlResources.UPDATE_Employee,body: params).then((json){
        if(json["status"]=="true")
        {
          insertdmessage = json["message"].toString();
          isupdate=true;
          viewemplyee(context);
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