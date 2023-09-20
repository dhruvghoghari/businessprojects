import 'package:businessprojects/screens/auth/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  logindata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
      {
        Navigator.pop(context);
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeScreen())
        );
      }
    else
      {
        Navigator.pop(context);
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => LoginScreen())
        );
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds:3), () {
      setState(() {
        logindata();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100.0),
          Lottie.asset('img/animation_lmgarkmu.json',
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
