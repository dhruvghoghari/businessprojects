import 'package:flutter/material.dart';

class StyleResources
{
  static Color BTN_COLOR = Colors.red;

  static TextStyle BTN_TEXT = TextStyle(
      color: Colors.white,
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 2.0);



  static CoustomTextfild (TextEditingController controller ,String text,IconData iconData,bool toHide )
  {
    return TextField(
      controller:controller,
      obscureText: toHide,
      decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )
      ),
    );
  }


  static coustomButton(VoidCallback VoidCallback,String text)
  {
    return SizedBox(height: 50.0,width: 350.0,
        child: ElevatedButton(onPressed: () {
      VoidCallback();
    },style: ElevatedButton.styleFrom(shape:
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),)
    ), child: Text(text,style: TextStyle(
        fontSize: 30.0,
        color: Colors.white
    ),)));

  }
}