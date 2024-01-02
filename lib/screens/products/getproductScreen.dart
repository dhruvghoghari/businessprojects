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
  getdata() async
  {
    await provider!.mainProduct(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<GetProduct>(context,listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<GetProduct>(context,listen: true);

    return Scaffold(
      appBar: AppBar(title: Text("getProductScreen"),),
      body: (provider!.allData==null)?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemCount: provider!.allData!.length,
        itemBuilder: (context,index)
          {
            return ListTile(
              title: Text(provider!.allData![index].title.toString()),
              subtitle:
              Column(
                children: [
                  Image.network(provider!.allData![index].thumbnail.toString()),
                  Text(provider!.allData![index].description.toString()),
                  Row(
                    children: [
                      Text(provider!.allData![index].price.toString()),
                      Text(provider!.allData![index].discountPercentage.toString()),
                    ],
                  ),
                  Text(provider!.allData![index].brand.toString()),
                  Text(provider!.allData![index].category.toString()),
                ],
              ),
            );
          }
      )
    );
  }
}
