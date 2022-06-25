import 'package:flutter/material.dart';
import 'package:maa/form_history/multiform.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maa/new_form/hive_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  final String phone;
  SignUpScreen(this.phone);
  // +91-${widget.phone}

  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  String name = '';
  String phoneNumber = '';
  String age = '';
  String weight = '';
  String height = '';

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  // Future<void> addUser() {
  //   // Call the user's CollectionReference to add a new user
  //   return users
  //       .add({
  //         'name': name, // John Doe
  //         'phoneNumber': phoneNumber, // Stokes and Sons
  //         'Age': age,
  //         'Weight': weight,
  //         'Height': height,
  //         // 42
  //       })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
            color: new Color.fromARGB(255, 192, 224, 236),
            gradient: LinearGradient(
              colors: [
                (new Color.fromARGB(255, 192, 224, 236)),
                new Color.fromARGB(255, 192, 224, 236)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   margin: EdgeInsets.only(top: 50),
              //   child: Image.asset(
              //     "images/app_logo.png",
              //     height: 90,
              //     width: 90,
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                alignment: Alignment.bottomRight,
                child: Text(
                  "Personal Information",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              )
            ],
          )),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 70),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            onChanged: (value) {
              name = value;
            },
            cursorColor: Color(0xFF586894),
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color(0xFF586894),
              ),
              hintText: "Full Name",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        // Container(
        //   alignment: Alignment.center,
        //   margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        //   padding: EdgeInsets.only(left: 20, right: 20),
        //   height: 54,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(50),
        //     color: Colors.grey[200],
        //     boxShadow: [
        //       BoxShadow(
        //           offset: Offset(0, 10),
        //           blurRadius: 50,
        //           color: Color(0xffEEEEEE)),
        //     ],
        //   ),
        //   child: TextField(
        //     onChanged: (value) {
        //       phoneNumber = widget.phone;
        //     },
        //     cursorColor: Color(0xffF5591F),
        //     decoration: InputDecoration(
        //         icon: Icon(
        //           Icons.phone,
        //           color: Color(0xffF5591F),
        //         ),
        //         label: Text(widget.phone),
        //         // hintText: widget.phone,
        //         enabledBorder: InputBorder.none,
        //         focusedBorder: InputBorder.none,
        //         enabled: false),
        //   ),
        // ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffEEEEEE),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              age = value;
            },
            cursorColor: Color(0xFF586894),
            decoration: InputDecoration(
              focusColor: Color(0xFF586894),
              icon: Icon(
                Icons.timeline,
                color: Color(0xFF586894),
              ),
              hintText: "Enter your Age",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffEEEEEE),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              weight = value;
            },
            cursorColor: Color(0xFF586894),
            decoration: InputDecoration(
              focusColor: Color(0xFF586894),
              icon: Icon(
                Icons.scale,
                color: Color(0xFF586894),
              ),
              hintText: "Your Weight in kg",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffEEEEEE),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              height = value;
            },
            cursorColor: Color(0xFF586894),
            decoration: InputDecoration(
              focusColor: Color(0xFF586894),
              icon: Icon(
                Icons.height,
                color: Color(0xFF586894),
              ),
              hintText: "Your Height in cm",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await users.add({
                  'name': name, // John Doe
                  'phoneNumber': '+91-${widget.phone}', // Stokes and Sons
                  'Age': age,
                  'Weight': weight,
                  'Height': height,
                  // 42
                }).then((value) => print("User Added"));
                var phoneNumber = '+91-${widget.phone}';
                saveInfo(phoneNumber, name, age, height, weight);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => hiveform()));
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF586894)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  'Send',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )),
        // GestureDetector(
        //   onTap: () {
        //     addUser();
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (context) => MultiForm()));
        //     // Write Click Listener Code Here.
        //   },
        //   child: Container(
        //     alignment: Alignment.center,
        //     margin: EdgeInsets.only(left: 20, right: 20, top: 70),
        //     padding: EdgeInsets.only(left: 20, right: 20),
        //     height: 54,
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //           colors: [(new Color(0xffF5591F)), new Color(0xffF2861E)],
        //           begin: Alignment.centerLeft,
        //           end: Alignment.centerRight),
        //       borderRadius: BorderRadius.circular(50),
        //       color: Colors.grey[200],
        //       boxShadow: [
        //         BoxShadow(
        //             offset: Offset(0, 10),
        //             blurRadius: 50,
        //             color: Color(0xffEEEEEE)),
        //       ],
        //     ),
        //     child: Text(
        //       "Next",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),
        // Container(
        //   margin: EdgeInsets.only(top: 10, bottom: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text("Have Already Member?  "),
        //       GestureDetector(
        //         child: Text(
        //           "Login Now",
        //           style: TextStyle(color: Color(0xffF5591F)),
        //         ),
        //         onTap: () {
        //           // Write Tap Code Here.
        //           Navigator.pop(context);
        //         },
        //       )
        //     ],
        //   ),
        // )
      ],
    )));
  }
}

saveInfo(String phoneNumber, String name, String age, String height,
    String weight) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('phoneNumber', phoneNumber);
  prefs.setString('name', name);
  prefs.setString('age', age);
  prefs.setString('height', height);
  prefs.setString('weight', weight);
  return prefs.commit();
}
