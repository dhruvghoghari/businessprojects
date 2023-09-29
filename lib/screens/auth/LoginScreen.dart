import 'package:businessprojects/providers/AuthProvider.dart';
import 'package:businessprojects/resources/StringResources.dart';
import 'package:businessprojects/resources/StyleResources.dart';
import 'package:businessprojects/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../others/HomePage.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  AuthProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<AuthProvider>(context,listen: false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                  },
                ),
                SizedBox(width: 100.0),
                Text("Login ",style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _name,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "User Name",
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.0),
                      right: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _password,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  icon: Icon(Icons.lock_open_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20.0),
                      right: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            PrimaryButton(
              btntext: StringResources.BTN_LOGIN_TEXT,
              onClick: () async{

                var name = _name.text.toString();
                var password = _password.text.toString();

                var params={
                  "name":name,
                  "password":password,
                  "device_token":"12345678",
                  "device_os":"android"
                };

                await provider!.checklogin(context,params);
                if(provider!.islogin)
                  {
                    var snackbar = SnackBar(content: Text(provider!.loginmessage));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage())
                    );
                  }
                else
                {
                  var snackbar = SnackBar(content: Text(provider!.loginmessage));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
            ),
            // GestureDetector(
            //   onTap: (){
            //
            //   },
            //   child: Container(
            //     width: 200.0,
            //     height: 60.0,
            //     color: StyleResources.BTN_COLOR,
            //     alignment: Alignment.center,
            //     padding: EdgeInsets.all(10.0),
            //     child: Text("Login",style: StyleResources.BTN_TEXT),
            //   ),
            // ),
            SizedBox(height: 10.0),
            Text("OR",style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20.0),
            Row(
              children: [
                SizedBox(width: 90.0),
                Text("Don't Have Account?",style: TextStyle(
                  fontSize: 15.0,
                ),),
                GestureDetector(
                  onTap: (){

                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen())
                    );
                  },
                  child: Text("Create Account",style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
