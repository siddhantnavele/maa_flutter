import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maa/dashboard/dash_home.dart';
import 'package:maa/dashboard/dashboard1.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_dynamic_list_view/models/user.dart';
// import 'package:flutter_dynamic_list_view/user_dialog.dart';
import 'modal_form/user.dart';
import 'package:maa/new_form/user_dialog.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyFlutterList(),
//       title: 'My Flutter List',
//     );
//   }
// }

class MyFlutterList extends StatefulWidget {
  const MyFlutterList({Key? key}) : super(key: key);

  @override
  _MyFlutterListState createState() => _MyFlutterListState();
}

class _MyFlutterListState extends State<MyFlutterList> {
  List<User> userList = [];

  @override
  Widget build(BuildContext context) {
    void addUserData(User user) {
      setState(() {
        userList.add(user);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: AddUserDialog(addUserData),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showUserDialog,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 192, 224, 236),
        elevation: .0,
        // leading: Icon(
        //   Icons.history_edu,
        //   color: Colors.black,
        // ),
        title: Text(
          'Your History',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Save'),
            textColor: Colors.black,
            // onPressed: onSave,
            onPressed: () {
              onSave();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HorizontalListPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: EdgeInsets.all(4),
              elevation: 8,
              child: ListTile(
                title: Text(
                  userList[index].username,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  userList[index].email,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                trailing: Text(
                  userList[index].phoneNo,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
          itemCount: userList.length,
        ),
      ),
    );
  }

  Future<void> onSave() async {
    // if (users.length > 0) {
    //   var allValid = true;
    //   users.forEach((form) => allValid = allValid && form.isValid());
    //   if (allValid) {
    //     var data = users.map((it) => it.user).toList();
    //     print(users);
    //     print("Just a devider");
    //     print(data);
    //     var no_condition = data.length.toString();
    //     print(no_condition);
    //     final rawJson = jsonEncode(data);
    final data = jsonEncode(userList);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setStringList(medical_hsitory_data, value)
    // prefs.setString('medical_history', rawJson);
    // prefs.setString('no_condition', no_condition);
    prefs.setString('medicals_history', data);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     fullscreenDialog: true,
    //     builder: (_) => Scaffold(
    //       appBar: AppBar(
    //         title: Text('List of Users'),
    //       ),
    //       body: ListView.builder(
    //         itemCount: data.length,
    //         itemBuilder: (_, i) => ListTile(
    //           leading: CircleAvatar(
    //             child: Text(data[i].fullName.substring(0, 1)),
    //           ),
    //           title: Text(data[i].fullName),
    //           subtitle: Text(data[i].email),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
  //   }
  // }
}
