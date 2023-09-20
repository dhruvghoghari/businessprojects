import 'package:flutter/material.dart';
import '../helpers/ApiHandler.dart';
import '../helpers/ErrorHandler.dart';
import '../models/Employee.dart';
import '../resources/UrlResources.dart';

class EmployeeProvider extends ChangeNotifier
{

  List<Employee>? alldata;

  Future<void> viewemplyee() async
  {

    try
        {
          await ApiHandler.getRequest(UrlResources.All_Employee).then((json){
            alldata = json["data"].map<Employee>((obj) => Employee.fromJson(obj)).toList();
            notifyListeners();
          });
        }
    on ErrorHandler catch (ex)
    {
      print(ex.message.toString());
      if(ex.message.toString()=="Internet Connection Failure")
      {
        Text("No Data");
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