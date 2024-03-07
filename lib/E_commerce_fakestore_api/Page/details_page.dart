import 'package:eccomerce_app/E_commerce_fakestore_api/Urls/api_services.dart';
import 'package:flutter/material.dart';

import '../model/signle_data_model.dart';


class DetailsPage extends StatefulWidget {
String productId;
String productTitle;
String productDescription;
  DetailsPage({super.key,
    required this.productId,
  required this.productTitle,
    required this.productDescription
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  SingleDataModel singleDataModel =SingleDataModel();
  bool isloading= false;

  getSingleproducts(){
    setState(() {
      isloading=true;
    });
    ApiServices().getSingleProduct(widget.productId).then((value) => {
      singleDataModel=value,
      setState(() {
        isloading=true;
      })

    }).onError((error, stackTrace) => {
      debugPrintStack()
    });

  }


  @override
  void initState() {
    getSingleproducts();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.productId.toString()),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(widget.productTitle),
            SizedBox(
              height: 10,
            ),
            Text(widget.productDescription),
          ],
        ),
      ),
    );
  }
}
