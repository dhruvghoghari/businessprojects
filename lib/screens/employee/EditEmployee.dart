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
import 'package:flutter/material.dart';

class EditEmployee extends StatefulWidget {

  Employee obj;
  EditEmployee({required this.obj});


  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {

  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();

  var gender="f";
  var department="sale";

  EmployeeProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name.text = widget.obj.ename.toString();
    _salary.text = widget.obj.salary.toString();
    gender = widget.obj.gender.toString();
    department = widget.obj.department.toString();


    provider = Provider.of<EmployeeProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.shade100,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Text("Edit Employee",style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          controller: _name,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: " Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20.0),
                                right: Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextField(
                          controller: _salary,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: " Salary",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20.0),
                                right: Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),

                      //  Gender
                      Row(
                        children: [
                          Text("Gender"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            groupValue: gender,
                            value: "M",
                            onChanged:(val){
                              setState(() {
                                gender=val!;
                              });
                            },
                          ),
                          Text("Male"),
                          Radio(
                            groupValue: gender,
                            value: "F",
                            onChanged: (val){
                              setState(() {
                                gender=val!;
                              });
                            },
                          ),
                          Text("Female")
                        ],
                      ),

                      // Department
                      Row(
                        children: [
                          Text("Department")
                        ],
                      ),
                      Row(
                        children: [
                          DropdownButton(
                            value: department,
                            onChanged: (val)
                            {
                              setState(() {
                                department=val!;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                child: Text("Sale"),
                                value: "sale",
                              ),
                              DropdownMenuItem(
                                child: Text("Purchase"),
                                value: "pr",
                              ),
                              DropdownMenuItem(
                                child: Text("Profit"),
                                value: "pt",
                              ),
                              DropdownMenuItem(
                                child: Text("pf"),
                                value: "pf",
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),

                      Container(
                        height: 50.0,
                        width: 150.0,
                        child: ElevatedButton(
                          onPressed: () async{

                            var name = _name.text.toString();
                            var salary = _salary.text.toString();
                            department.toString();
                            gender.toString();

                            var params =
                            {
                              "ename":name,
                              "salary":salary,
                              "department":department,
                              "gender":gender,
                              "eid":widget.obj.eid
                            };

                            await provider!.updateEmployee(context,params);
                            if(provider!.isupdate)
                              {
                                Navigator.of(context).pop();
                                var snackbar = SnackBar(content: Text(provider!.insertdmessage),);
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }
                            else
                              {
                                var snackbar = SnackBar(content: Text(provider!.insertdmessage),);
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }

                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: Text("Update ",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
