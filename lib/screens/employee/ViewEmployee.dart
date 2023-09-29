import 'dart:convert';
import 'package:businessprojects/helpers/ApiHandler.dart';
import 'package:businessprojects/providers/EmployeeProvider.dart';
import 'package:businessprojects/providers/ProductProvider.dart';
import 'package:businessprojects/resources/UrlResources.dart';
import 'package:businessprojects/screens/employee/EditEmployee.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../models/Employee.dart';

class ViewEmployee extends StatefulWidget {
  const ViewEmployee({Key? key}) : super(key: key);

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}
class _ViewEmployeeState extends State<ViewEmployee> {


  EmployeeProvider? provider;

  getdata() async
  {
    await provider!.viewemplyee(context);
    // Uri url = Uri.parse(UrlResources.All_Employee);
    // var response = await http.get(url);
    // if(response.statusCode==200)
    //   {
    //     var body = response.body.toString();
    //     var json = jsonDecode(body);
    //
    //     setState(() {
    //       alldata = json["data"].map<Employee>((obj) => Employee.fromJson(obj)).toList();
    //     });
    //   }
    // else
    //   {
    //     return[];
    //   }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployeeProvider>(context,listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<EmployeeProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(title: Text("ViewEmployee"),),
      body: provider!.ealldata==null?Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount: provider!.ealldata!.length,
        itemBuilder: (context,index)
        {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                ),],
            ),
            child: Column(
              children: [
                Text(provider!.ealldata![index].ename.toString()),
                Text(provider!.ealldata![index].salary.toString()),
                Text(provider!.ealldata![index].gender.toString()),
                Text(provider!.ealldata![index].department.toString()),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async{

                        var eid = provider!.ealldata![index].eid.toString();
                        var parms = {
                          "eid":eid
                        };
                        await provider!.Deleteemployee(context,parms);

                        if(provider!.isdelete)
                          {
                            var snackbar = SnackBar(content: Text(provider!.deletemsg),);
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          }
                        else
                          {
                            var snackbar = SnackBar(content: Text(provider!.deletemsg),);
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          }
                        // await ApiHandler.postRequest(UrlResources.Delete_Employee,body: parms).then((json){
                        //     if(json["status"]=="true")
                        //     {
                        //       var message = json["message"].toString();
                        //       var snackbar = SnackBar(content: Text(message),);
                        //       ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        //       getdata();
                        //     }
                        //     else
                        //     {
                        //       var message = json["message"].toString();
                        //       var snackbar = SnackBar(content: Text(message),);
                        //       ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        //     }
                        // });
                        // Uri url = Uri.parse(UrlResources.Delete_Employee);
                        // var parms = {
                        //   "eid":eid
                        // };
                        // var response = await http.post(url,body: parms);
                        // if(response.statusCode==200)
                        // {
                        //   var json = jsonDecode(response.body.toString());
                        //   if(json["status"]=="true")
                        //   {
                        //     var message = json["message"].toString();
                        //     var snackbar = SnackBar(content: Text(message),);
                        //     ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        //     getdata();
                        //   }
                        //   else
                        //   {
                        //     var message = json["message"].toString();
                        //     var snackbar = SnackBar(content: Text(message),);
                        //     ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        //   }
                        // }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => EditEmployee(
                            obj: provider!.ealldata![index],
                          ))
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        }
      ),
    );
  }
}


