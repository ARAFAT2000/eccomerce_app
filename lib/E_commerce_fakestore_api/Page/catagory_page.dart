import 'package:eccomerce_app/E_commerce_fakestore_api/Page/catagory_details.dart';
import 'package:flutter/material.dart';

import '../Urls/api_services.dart';

class CatagoryPage extends StatefulWidget {
  const CatagoryPage({super.key});

  @override
  State<CatagoryPage> createState() => _CatagoryPageState();
}

class _CatagoryPageState extends State<CatagoryPage> {

  bool isloading= false;

  dynamic catagory;

  getallCatagory(){
    setState(() {
      isloading=true;
    });
    ApiServices().getAllCatagory().then((value) => {
      catagory=value,
      setState(() {
        isloading=true;
      })

    }).onError((error, stackTrace) => {
      debugPrintStack()
    });
  }
  @override
  void initState() {
    getallCatagory();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Catagory Screen'),
      ),
      body: ListView.separated(
        itemCount:catagory.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
           itemBuilder: (context,index){
             return ListTile(
               onTap: (){
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>
                         CatagoryDetails(catagoryname: catagory[index])));
               },
               title: Text(catagory[index].toString()),

             );
           },
      )
    );
  }
}
