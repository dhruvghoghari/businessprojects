import 'dart:convert';
import 'package:businessprojects/helpers/ApiHandler.dart';
import 'package:businessprojects/providers/ProductProvider.dart';
import 'package:businessprojects/resources/UrlResources.dart';
import 'package:businessprojects/screens/products/ViewProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../models/Product.dart';

class EditProduct extends StatefulWidget {


  var pid = "";
  EditProduct({required this.pid});
 // Products obj;
 // EditProduct({required this.obj});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {

  TextEditingController _name = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _quantity = TextEditingController();

  ProductProvider? provider;

  getdata() async
  {
    var params = {
      "pid":widget.pid.toString()
    };
    await provider!.getsingledata(context,params);

    _name.text = provider!.singleobj!.pname.toString();
    _price.text = provider!.singleobj!.price.toString();
    _quantity.text = provider!.singleobj!.qty.toString();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _name.text = widget.obj.pname.toString();
    // _price.text = widget.obj.price.toString();
    // _quantity.text = widget.obj.qty.toString();
    provider = Provider.of<ProductProvider>(context,listen: false);
    getdata();
  }


  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              Column(
                children: [
                  Text("Edit Product ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),)
                ],
              ),
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
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: " Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20.0),
                        right: Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _quantity,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "quantity",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20.0),
                        right: Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50.0,
                width: 150.0,
                child: ElevatedButton(
                  onPressed: ()  async{

                    var nm = _name.text.toString();
                    var price = _price.text.toString();
                    var qty = _quantity.text.toString();

                    var params= {
                      "pname":nm,
                      "qty":qty,
                      "price":price,
                      "pid":widget.pid
                    };
                    await  provider!.updateproduct(context,params);
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
    );
  }
}
