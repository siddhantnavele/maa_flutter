// import 'dart:html';
// import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:maa/dashboard/scroll_wala.dart';
import 'package:maa/info/home_page.dart';
import 'package:maa/src/pages/home_page.dart';
import 'package:maa/src/theme/extention.dart';
import 'package:maa/src/theme/text_styles.dart';
import 'package:maa/src/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'scroll_wala.dart'

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HorizontalListPage(widget.phone),
//   ));
// }
List imgList = [
  'assets/hospital_card.png',
  'assets/doctor_card.png',
  'assets/info_card.png'
];

class HorizontalListPage extends StatefulWidget {
  //  late final List<User> userList;
  // // HorizontalListPage(this.userList);
  // This widget is the root of your application.
  @override
  _HorizontalListPageState createState() => _HorizontalListPageState();
}

class _HorizontalListPageState extends State<HorizontalListPage> {
  String latitude = '';
  String longitude = '';
  String phoneNumber = "";
  String name = "";
  String age = "";
  String height = "";
  String weight = "";
  String medical_history = "";
  late LatLon Currentposition;
  List<Map<String, dynamic>> _items = [];
  double rating = 0;
  String length = "";

  final _shoppingBox = Hive.box('shopping_box');

  get child => null;

  // void _getUserLocation() async {
  //   var position = await GeolocatorPlatform.instance
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   setState(() {
  //     Currentposition = LatLon(position.latitude, position.longitude);
  //     var googleplace = GooglePlace("AIzaSyA7yRNvAr5qjXKIHSoKXnZkJRDWKl4Mhik");
  // var result = await googleplace.search.getNearBySearch(Location(C), 1500, type: "hospital");
  //   });
  // }

  // String BMi = weight/(height*0.01);

// viewphoneNumber() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   setState(() {
//       var _email = (prefs.getString('email')??'');
// };

  @override
  void initState() {
    // viewphoneNumber().then(updatephone);

    super.initState();
    // getCurrentlocation();
    // _getUserLocation();
    _loadCounter();
    _refreshItems();
    // getData();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phoneNumber = (prefs.getString('phoneNumber') ?? '');
      name = (prefs.getString('name') ?? '');
      age = (prefs.getString('age') ?? '');
      height = (prefs.getString('height') ?? '');
      weight = (prefs.getString('weight') ?? '');
      medical_history = (prefs.getString('medical_history') ?? '');
    });
  }

  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final value = _shoppingBox.get(key);
      return {
        "key": key,
        "Disease_name": value["Disease_name"],
        "Hospital_name": value["Hospital_name"],
        "Doctor_name": value["Doctor_name"],
        // "rating": value["rating"]
        // "quantity": value['quantity']
      };
    }).toList();
    setState(() {
      _items = data.reversed.toList();
      length = _items.length.toString();
      // we use "reversed" to sort items in order from the latest to the oldest
    });
  }

  // getData() async {
  //   return await FirebaseFirestore.instance
  //       .collection('users')
  //       // .where('phoneNumber', isEqualTo: phoneNumber)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       setState(() {
  //         name = doc["name"];
  //         age = doc["Age"];
  //         height = doc["Height"];
  //         weight = doc["Weight"];
  //       });
  //     });
  //   });
  // }

  // void updatephone(String phoneNumber) {
  //   setState(() {
  //     this.phoneNUmber = phoneNumber;
  //   });
  // }

  getCurrentlocation() async {
    var position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() async {
      Currentposition = LatLon(position.latitude, position.longitude);
      var googleplace = GooglePlace("AIzaSyA7yRNvAr5qjXKIHSoKXnZkJRDWKl4Mhik");
      var result = await googleplace.search.getNearBySearch(
          Location(lat: position.latitude, lng: position.longitude), 1500,
          type: "hospital");
    });
    // final geoposition = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);

    // setState(() {
    //   // latitude = '($geoposition.latitude)';
    //   // longitude = ('$geoposition.longitude');
    // });
  }

//   late List<DocumentSnapshot> documentList;
// documentList = (await Firestore.instance
//         .collection("users")
//         .document(await firestoreProvider.getUid())
//         .collection(caseCategory)
//         .where("caseNumber", isEqualTo: query)
//         .getDocuments())
//         .documents;

  List<Map> categories = [
    {'name': 'Ruby Hall Clinic', 'iconPath': 'assets/icons/all_icon.png'},
    {'name': 'Jehangir Hospital', 'iconPath': 'assets/icons/fav_icon.png'},
    {
      'name': 'Aditya Brila Hospital',
      'iconPath': 'assets/icons/anxious_icon.png'
    },
    {
      'name': 'Columbia Asia Hospital Pune',
      'iconPath': 'assets/icons/kid_icon.png'
    },
    {
      'name': 'Nobel Hospital Hadapsar',
      'iconPath': 'assets/icons/moon_icon.png'
    },
    {'name': 'Ranka HOspital', 'iconPath': 'assets/icons/all_icon.png'},
    {'name': 'Sancheti HOspital', 'iconPath': 'assets/icons/fav_icon.png'},
    {'name': 'Vishwaraj Hospital', 'iconPath': 'assets/icons/anxious_icon.png'},
    {'name': 'Medipoint Hospital', 'iconPath': 'assets/icons/kid_icon.png'},
    {'name': 'Star Hsopital', 'iconPath': 'assets/icons/moon_icon.png'},
  ];

  int _current = 0;

  List<Map> card_scroll = [
    {"Texts": 'Need to Find Hospital?', "Images": 'assets/hospital_card.png'},
    {"Texts": 'Consult a Doctor?', "Images": 'assets/doctor_card.png'},
    {"Texts": 'Know Your Disease...', "Images": 'assets/info_card.png'},
  ];

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Column(
              children: [
                Container(
                  // margin: EdgeInsets.all(8),
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ))
      .toList();

  Color primaryBlue = const Color(0xFF586894);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xfff7f6fb),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            // Center(
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: [
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.of(context).push(MaterialPageRoute(
            //                 builder: (context) => HomePage123()));
            //           },
            //           child: Container(
            //             height: 170,
            //             width: 300,
            //             color: Color.fromARGB(255, 237, 242, 243),
            //             child: Column(
            //               children: [
            //                 Container(
            //                   // margin: EdgeInsets.all(8),
            //                   height: 130,
            //                   width: 300,
            //                   decoration: BoxDecoration(
            //                     image: DecorationImage(
            //                       image: AssetImage("assets/hospital_card.png"),
            //                       fit: BoxFit.cover,
            //                     ),
            //                   ),
            //                 ),
            //                 Container(
            //                   width: 285,
            //                   child: Center(
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Text(
            //                         "Need to Find Hospital?",
            //                         style: TextStyle(
            //                             fontSize: 20.0,
            //                             fontWeight: FontWeight.bold,
            //                             fontStyle: FontStyle.normal,
            //                             color: Colors.black54),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         SizedBox(width: 10),
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.of(context).push(MaterialPageRoute(
            //                 builder: (context) => HomePage123()));
            //           },
            //           child: Container(
            //             height: 170,
            //             width: 300,
            //             color: Color.fromARGB(255, 237, 242, 243),
            //             child: Column(
            //               children: [
            //                 Container(
            //                   // margin: EdgeInsets.all(8),
            //                   height: 130,
            //                   width: 300,
            //                   decoration: BoxDecoration(
            //                     image: DecorationImage(
            //                       image: AssetImage("assets/doctor_card.png"),
            //                       fit: BoxFit.cover,
            //                     ),
            //                   ),
            //                 ),
            //                 Container(
            //                   width: 285,
            //                   child: Center(
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Text(
            //                         "Consult a Doctor?",
            //                         style: TextStyle(
            //                             fontSize: 20.0,
            //                             fontWeight: FontWeight.bold,
            //                             fontStyle: FontStyle.normal,
            //                             color: Colors.black54),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             Navigator.of(context).push(
            //                 MaterialPageRoute(builder: (context) => HomePage()));
            //           },
            //           child: Container(
            //             height: 170,
            //             width: 300,
            //             color: Color.fromARGB(255, 237, 242, 243),
            //             child: Column(
            //               children: [
            //                 Container(
            //                   // margin: EdgeInsets.all(8),
            //                   height: 130,
            //                   width: 300,
            //                   decoration: BoxDecoration(
            //                     image: DecorationImage(
            //                       image: AssetImage("assets/info_card.png"),
            //                       fit: BoxFit.cover,
            //                     ),
            //                   ),
            //                 ),
            //                 Container(
            //                   width: 285,
            //                   child: Center(
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Text(
            //                         "Know Your Disease...",
            //                         style: TextStyle(
            //                             fontSize: 20.0,
            //                             fontWeight: FontWeight.bold,
            //                             fontStyle: FontStyle.normal,
            //                             color: Colors.black54),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  height: 150,
                  width: 350,
                  color: Colors.white30,
                  child: Row(children: [
                    Container(
                      height: 150,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/search_card.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 152,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Find Nearby \nHospitals",
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                  ])),
            ),
            SingleChildScrollView(
              child: Column(children: [
                // Text(medical_history),
                // Text(age),
                // Text(phoneNumber),
                // Text(latitude),
                // Text(longitude),

                // this code below will be used for shwoing hospitals nearby

                // Padding(
                //   padding: const EdgeInsets.only(right: 110),
                //   child: const Text(
                //     "Hospitals Near You...",
                //     style: TextStyle(
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.bold,
                //         fontStyle: FontStyle.normal,
                //         color: Colors.black54),
                //     // textAlign: TextAlign.left,
                //   ),
                // ),
                // // Text(
                // //   "Welcome to MAA!!",
                // //   style: TextStyle(
                // //       fontSize: 35.0,
                // //       fontWeight: FontWeight.bold,
                // //       fontStyle: FontStyle.normal,
                // //       color: Colors.black),
                // //   textAlign: TextAlign.center,
                // // ),
                // // SizedBox(
                // //   height: 10,
                // // ),
                // // Text(
                // //   "Faster search and Acute results...",
                // //   style: TextStyle(
                // //       fontSize: 20.0,
                // //       fontWeight: FontWeight.bold,
                // //       fontStyle: FontStyle.normal,
                // //       color: Colors.black54),
                // //   textAlign: TextAlign.center,
                // // ),
                // const SizedBox(
                //   height: 30,
                // ),
                // Container(
                //   height: 150,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: categories.length,
                //       itemBuilder: (context, index) {
                //         return Container(
                //           child: Column(
                //             children: [
                //               Container(
                //                   padding: const EdgeInsets.only(
                //                       top: 50, left: 50, right: 50, bottom: 80),
                //                   margin: const EdgeInsets.only(
                //                     left: 15,
                //                   ),
                //                   decoration: BoxDecoration(
                //                     color: Color.fromARGB(255, 14, 99, 133),
                //                     borderRadius: BorderRadius.circular(25),
                //                     // boxShadow: [
                //                     //   BoxShadow(
                //                     //     color: Colors.grey.withOpacity(0.5),
                //                     //     spreadRadius: 5,
                //                     //     blurRadius: 7,
                //                     //     offset: Offset(
                //                     //         0, 3), // changes position of shadow
                //                     //   ),
                //                     // ],
                //                   ),
                //                   child: Column(
                //                     children: [
                //                       Text(
                //                         categories[index]['name'],
                //                         style: TextStyle(color: Colors.white),
                //                         textAlign: TextAlign.center,
                //                       )
                //                     ],
                //                   )),
                //             ],
                //           ),
                //         );
                //       }),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text(
                    "Your Record...",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.black54),
                    // textAlign: TextAlign.left,
                  ),
                ),
                // SizedBox(
                //   height: 5,
                // ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      height: 100,
                      padding: new EdgeInsets.all(2.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Color.fromRGBO(0, 180, 216, 1),
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Icon(Icons.timelapse, size: 40),
                              ),
                              // tileColor: Colors.white24,
                              title: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 5),
                                child:
                                    Text(age, style: TextStyle(fontSize: 30.0)),
                              ),
                              subtitle: Text('Your Age',
                                  style: TextStyle(fontSize: 13.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 100,
                      padding: new EdgeInsets.all(2.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Color.fromRGBO(0, 180, 216, 1),
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Icon(Icons.scale_rounded, size: 40),
                              ),
                              title: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 5),
                                child: Text(weight,
                                    style: TextStyle(fontSize: 30.0)),
                              ),
                              subtitle: Text('Your Weight',
                                  style: TextStyle(fontSize: 12.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Row(
                  children: [
                    Container(
                      width: 180,
                      height: 100,
                      padding: new EdgeInsets.all(2.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Color.fromRGBO(0, 180, 216, 1),
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Icon(Icons.height, size: 45),
                              ),
                              title: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 5),
                                child: Text(height,
                                    style: TextStyle(fontSize: 30.0)),
                              ),
                              subtitle: Text('Your Height',
                                  style: TextStyle(fontSize: 12.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 100,
                      padding: new EdgeInsets.all(2.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Color.fromRGBO(0, 180, 216, 1),
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child:
                                    Icon(Icons.local_activity_sharp, size: 40),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 5,
                                ),
                                child: Text(length,
                                    style: TextStyle(fontSize: 30.0)),
                              ),
                              subtitle: Text('Treatments',
                                  style: TextStyle(fontSize: 13.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Container(
                //   width: 500,
                //   height: 100,
                //   padding: new EdgeInsets.all(8.0),
                //   child: Card(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(15.0),
                //     ),
                //     color: Color.fromARGB(255, 28, 216, 230),
                //     elevation: 10,
                //     child: Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: <Widget>[
                //         ListTile(
                //           leading: Icon(Icons.height, size: 45),
                //           title: Text(height, style: TextStyle(fontSize: 25.0)),
                //           subtitle: Text('Your Current Height',
                //               style: TextStyle(fontSize: 15.0)),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Container(
                //   width: 500,
                //   height: 100,
                //   padding: new EdgeInsets.all(8.0),
                //   child: Card(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(15.0),
                //     ),
                //     color: Color.fromARGB(255, 28, 216, 230),
                //     elevation: 10,
                //     child: Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: <Widget>[
                //         ListTile(
                //           leading: Icon(Icons.local_activity_sharp, size: 45),
                //           title: Text(length, style: TextStyle(fontSize: 25.0)),
                //           subtitle: Text('Number Of Treatments Taken',
                //               style: TextStyle(fontSize: 15.0)),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class CorouselSlider {
  static builder() {}
}
