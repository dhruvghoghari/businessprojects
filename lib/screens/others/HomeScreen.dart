import 'package:businessprojects/screens/auth/LoginScreen.dart';
import 'package:businessprojects/screens/employee/AddEmployee.dart';
import 'package:businessprojects/screens/products/AddProduct.dart';
import 'package:flutter/material.dart';

import '../employee/ViewEmployee.dart';
import '../products/ViewProduct.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomeScreen"),),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("AddProduct"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddProduct())
                );
              },
            ),
            ListTile(
              title: Text("ViewProduct"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ViewProduct())
                );
              },
            ),
            ListTile(
              title: Text("Add Employe"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddEmploy())
                );
              },
            ),
            ListTile(
              title: Text("ViewEmploye"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ViewEmployee())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
