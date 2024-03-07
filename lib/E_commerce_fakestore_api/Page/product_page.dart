import 'package:eccomerce_app/E_commerce_fakestore_api/Page/details_page.dart';
import 'package:eccomerce_app/E_commerce_fakestore_api/Urls/api_services.dart';
import 'package:flutter/material.dart';

import '../model/productsmodel.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {


  List<ProductsModel> productsmodel=[];
bool isloading= false;

  getAllproducts(){
    setState(() {
      isloading=true;
    });
    ApiServices().getAllProducts().then((value) => {
    productsmodel=value,
    setState(() {
    isloading=true;
    })

    }).onError((error, stackTrace) => {
    debugPrintStack()
    });

  }
  @override
  void initState() {
  // apiServices.getAllProducts();
    getAllproducts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemCount:productsmodel.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 5,),
           itemBuilder: (context,index){
            var data= productsmodel[index];
            return GestureDetector(
              // onTap: (){
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context)=>
              //           DetailsPage(
              //             productId: data.id.toString(),
              //             productTitle: data.title.toString(),
              //             productDescription: data.description.toString(),
              //           )));
              // },
              child: Card(
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.id.toString()),
                    Text(data.title.toString()),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>
                              DetailsPage(
                                productId: data.id.toString(),
                                productTitle: data.title.toString(),
                                productDescription: data.description.toString(),
                              )));
                    },
                        child: Text('Cart'))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
