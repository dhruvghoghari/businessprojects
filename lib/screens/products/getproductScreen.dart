import 'package:businessprojects/providers/GetProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class getproductScreen extends StatefulWidget {

  @override
  State<getproductScreen> createState() => _getproductScreenState();
}

class _getproductScreenState extends State<getproductScreen> {

  GetProduct? provider;

  var selected="";

  getdata() async {
    await provider!.mainProduct(context);
  }

  @override
  void initState() {
    super.initState();
    provider = Provider.of<GetProduct>(context, listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<GetProduct>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("getProductScreen"),
      ),
      body:Column(
        children: [
          Container(
            child: DropdownButton(
              onChanged: (val){
                setState(() {
                  selected=val!;
                });
              },
              value: selected,
              items: provider!.allData!.map((obj){
                return DropdownMenuItem(
                  child: Text(provider!.allData!.first.id.toString()),
                  value: obj.title.toString(),
                );
              }).toList(),
            ),
          )
        ],
      )
    );
  }
}
