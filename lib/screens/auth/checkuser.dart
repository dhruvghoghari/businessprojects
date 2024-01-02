import 'package:businessprojects/providers/LoginProvider.dart';
import 'package:businessprojects/resources/StyleResources.dart';
import 'package:businessprojects/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class checkuser extends StatefulWidget {

  @override
  State<checkuser> createState() => _checkuserState();
}

class _checkuserState extends State<checkuser> {


  TextEditingController email = TextEditingController();
  TextEditingController password =TextEditingController();

  LoginProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<LoginProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoginPage"),),
      body: SafeArea(
        child: Column(
          children: [
            StyleResources.CoustomTextfild(email, "Email", Icons.email_outlined, false),
            StyleResources.CoustomTextfild(password, "Password", Icons.lock_open_outlined, true),

            SizedBox(height: 20.0),

            PrimaryButton(
                btntext: "Login",
                onClick: () async{
                  var em = email.text.toString();
                  var pass = password.text.toString();

                  var params =
                  {
                    "name":"name",
                    "password":"password",
                    "device_token":"12345678",
                    "device_os":"android"
                  };

                  await provider!.checkLogin(context,params);
                  if(provider!.isLogin)
                    {
                      var snackbar = SnackBar(content: Text(provider!.message));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  else
                  {
                    var snackbar = SnackBar(content: Text(provider!.message));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                })
          ],
        ),
      ),
    );
  }
}
