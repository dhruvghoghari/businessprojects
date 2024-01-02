import 'package:businessprojects/providers/AuthProvider.dart';
import 'package:businessprojects/providers/EmployeeProvider.dart';
import 'package:businessprojects/providers/GetProduct.dart';
import 'package:businessprojects/providers/LoginProvider.dart';
import 'package:businessprojects/providers/ProductProvider.dart';
import 'package:businessprojects/screens/auth/LoginScreen.dart';
import 'package:businessprojects/screens/auth/checkuser.dart';
import 'package:businessprojects/screens/auth/RegisterScreen.dart';
import 'package:businessprojects/screens/employee/AddEmployee.dart';
import 'package:businessprojects/screens/others/HomeScreen.dart';
import 'package:businessprojects/screens/others/SplashScreen.dart';
import 'package:businessprojects/screens/products/AddProduct.dart';
import 'package:businessprojects/screens/products/getproductScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
        ChangeNotifierProvider(create: (context)=>EmployeeProvider()),
        ChangeNotifierProvider(create: (context)=>AuthProvider()),
        ChangeNotifierProvider(create: (context)=>GetProduct()),
        ChangeNotifierProvider(create: (context)=>LoginProvider()),


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
        home: checkuser(),
      ),
    );
  }
}

