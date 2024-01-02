import 'dart:convert';
import 'package:businessprojects/helpers/ApiHandler.dart';
import 'package:businessprojects/resources/UrlResources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/ErrorHandler.dart';
import '../../models/Product.dart';
import 'package:http/http.dart' as http;
import '../../providers/ProductProvider.dart';
class ViewProduct2 extends StatefulWidget {

  @override
  State<ViewProduct2> createState() => _ViewProduct2State();
}
class _ViewProduct2State extends State<ViewProduct2> {


  ProductProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
  }


  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
        appBar: AppBar(title: Text("View Products 2")),
        body: (provider!.alldata==null)?Center(child: Text("Waiting..."),):ListView.builder(
          itemCount: provider!.alldata!.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(provider!.alldata![index].pname.toString()),
                subtitle: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async{

                        var pid = provider!.alldata![index].pid.toString();
                        var params = {
                          "pid":pid
                        };
                        await provider!.deleteproduct(context,params);

                        if(provider!.isdelete)
                        {
                          print("Deleted success");
                        }
                        else
                        {
                          print("Delete Fail");
                        }
                      },
                    ),  // delete
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("₹." +provider!.alldata![index].price.toString()),
                      SizedBox(height:5.0),
                      Text(provider!.alldata![index].qty.toString()),
                    ],
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
