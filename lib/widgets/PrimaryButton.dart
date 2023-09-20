import 'package:flutter/material.dart';
import '../resources/StyleResources.dart';

class PrimaryButton extends StatelessWidget {

  var btntext = "";
  GestureTapCallback onClick;

  PrimaryButton({required this.btntext,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onClick,
      child: Container(
        width: 300.0,
        height: 50.0,
        color: StyleResources.BTN_COLOR,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10.0),
        child: Text(btntext,style: StyleResources.BTN_TEXT),
      ),
    );
  }
}
