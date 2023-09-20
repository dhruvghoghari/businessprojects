import 'dart:convert';
import 'package:businessprojects/helpers/ApiHandler.dart';
import 'package:businessprojects/providers/ProductProvider.dart';
import 'package:businessprojects/resources/UrlResources.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../models/Product.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  TextEditingController _name = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _quantity = TextEditingController();

  ProductProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
  }

 //
 // try
 //  {
 //  var x=10;
 //  var y=0;
 //  var result =  x / y;
 //  print(result);
 //  }
 //  catch()
 //  {
 //    print("Not devide by 0");
 //  }
  //finally(){
  // }


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
                  Text("Add Product ",style: TextStyle(
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
                      "price":price
                    };

                    await provider!.addproduct(context,params);

                    if(provider!.isinserted)
                      {
                          var snackbar = SnackBar(content: Text(provider!.insertmessage));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    else
                      {
                        var snackbar = SnackBar(content: Text(provider!.insertmessage));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }


                    // Uri url = Uri.parse(UrlResources.ADD_PRODUCT);
                    //
                    // var response = await http.post(url,body: params);
                    // if(response.statusCode==200)
                    //   {
                    //     var json = jsonDecode(response.body.toString());
                    //     if(json["status"]=="true")
                    //       {
                    //         var message = json["message"].toString();
                    //         var snackbar = SnackBar(content: Text(message));
                    //         ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    //         _name.text="";
                    //         _quantity.text="";
                    //         _price.text="";
                    //       }
                    //     else
                    //       {
                    //         var message = json["message"].toString();
                    //         var snackbar = SnackBar(content: Text(message));
                    //         ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    //       }
                    //   }
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: Text("ADD ",style: TextStyle(
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
