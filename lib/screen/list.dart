import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maa/screen/productDetailScreen.dart';

import '../controller/hospital.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  late String texttext;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HospitalController>(
        init: HospitalController(),
        initState: (_) {},
        builder: (_) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
              ),
              GetBuilder<HospitalController>(
                init: HospitalController(),
                initState: (_) {},
                builder: (_) {
                  return TextField(
                      decoration: const InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                          )),
                      controller: _.searchFiels,
                      onChanged: (Text) {
                        setState(() {
                          _.searchFiels.text == Text;
                        });
                      });
                },
              ),

              Expanded(child: heart()),

              //       if(_.searchFiels.text=='1'){
              //         return heart();
              // }else if(_.searchFiels.text=='0'){
              //         Neuro()
              // }else{
              //       Expanded(child: Text("Search"))}
            ],
          );
        },
      ),
    );
  }

  heart() {
    return GetBuilder<HospitalController>(
      init: HospitalController(),
      initState: (_) {},
      builder: (_) {
        if (_.searchFiels.text == 'heart') {
          return Container(
            child: _.hospitalList1!.length == 0
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _.hospitalList1!.length,
                    itemBuilder: ((context, i) {
                      final data = _.hospitalList1![i];
                      return InkWell(
                        onTap: () {
                          Get.to(ProductDetails(
                            dir: data.locationCoordinates,
                            title: data.hospitalName,
                            Address: data.addressOriginalFirstLine,
                            dis: data.district,
                            phone: data.mobileNumber,
                            pin: data.pincode,
                            sta: data.state,
                            wib: data.website,
                          ));
                        },
                        child: ListTile(
                          title: Text(data.hospitalName),
                          subtitle: Text(data.mobileNumber),
                        ),
                      );
                    })),
          );
        } else if (_.searchFiels.text == 'ortho') {
          return Container(
            child: _.hospitalList!.length == 0
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _.hospitalList!.length,
                    itemBuilder: ((context, i) {
                      final data = _.hospitalList![i];
                      return InkWell(
                        onTap: () {
                          Get.to(ProductDetails(
                            dir: data.locationCoordinates,
                            title: data.hospitalName,
                            Address: data.addressOriginalFirstLine,
                            dis: data.district,
                            phone: data.mobileNumber,
                            pin: data.pincode,
                            sta: data.state,
                            wib: data.website,
                          ));
                        },
                        child: ListTile(
                          title: Text(data.hospitalName),
                          subtitle: Text(data.mobileNumber),
                        ),
                      );
                    })),
          );
        } else if (_.searchFiels.text == 'neuro') {
          return Container(
            child: _.hospitalList2!.length == 0
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _.hospitalList2!.length,
                    itemBuilder: ((context, i) {
                      final data = _.hospitalList2![i];
                      return InkWell(
                        onTap: () {
                          Get.to(ProductDetails(
                            title: data.hospitalName,
                            Address: data.addressOriginalFirstLine,
                            dis: data.district,
                            phone: data.mobileNumber,
                            pin: data.pincode,
                            sta: data.state,
                            wib: data.website,
                            dir: data.locationCoordinates,
                          ));
                        },
                        child: ListTile(
                          title: Text(data.hospitalName),
                          subtitle: Text(data.mobileNumber),
                        ),
                      );
                    })),
          );
        } else if (_.searchFiels.text == 'cancer') {
          return Container(
            child: _.hospitalList3!.length == 0
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _.hospitalList3!.length,
                    itemBuilder: ((context, i) {
                      final data = _.hospitalList3![i];
                      return InkWell(
                        onTap: () {
                          Get.to(ProductDetails(
                            title: data.hospitalName,
                            Address: data.addressOriginalFirstLine,
                            dis: data.district,
                            phone: data.mobileNumber,
                            pin: data.pincode,
                            sta: data.state,
                            wib: data.website,
                            dir: data.locationCoordinates,
                          ));
                        },
                        child: ListTile(
                          // visualDensity:
                          //     VisualDensity(horizontal: 0, vertical: -4),
                          title: Text(data.hospitalName),
                          subtitle: Text(data.mobileNumber),
                        ),
                      );
                    })),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Text(
                      "Search for \nyour Disease \nhere...",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.black54),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 60),
                    child: Text(
                      "We will Reccomend Hospitals accordingly.",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.black38),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
