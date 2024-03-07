import 'package:eccomerce_app/E_commerce_fakestore_api/Page/details_page.dart';
import 'package:flutter/material.dart';

import '../Urls/api_services.dart';
import '../model/catagory_list_model.dart';


class CatagoryDetails extends StatefulWidget {

  String catagoryname;
   CatagoryDetails({super.key,required this.catagoryname});

  @override
  State<CatagoryDetails> createState() => _CatagoryDetailsState();
}

class _CatagoryDetailsState extends State<CatagoryDetails> {

  List<CatagorylistModel> catagorylist=[];

  bool isloading= false;
  getCatagory(){
    setState(() {
      isloading=true;
    });
    ApiServices().getCatagoryList(widget.catagoryname).then((value) => {
      catagorylist=value,
      setState(() {
        isloading=true;
      })

    }).onError((error, stackTrace) => {
      debugPrintStack()
    });

  }
  @override
  void initState() {
    getCatagory();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.catagoryname),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemCount:catagorylist.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(height: 5,),
          itemBuilder: (context,index){
            var data= catagorylist[index];
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
                         MaterialPageRoute(builder: (context)=>DetailsPage(
                             productId: data.id.toString(),
                             productTitle: data.title.toString(),
                             productDescription:data.description.toString())));
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
