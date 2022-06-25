import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maa/dashboard/dashboard.dart';
import 'package:maa/dashboard/drawer/medical_history.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'empty_state.dart';
import 'form.dart';
import 'user.dart';
import '../info/home_page.dart';
import '../dashboard/dashboard1.dart';

class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<UserForm> users = [];
  // List<UserForm> forms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                MaterialPageRoute(builder: (context) => dashboard()),
              );
            },
          ),
          // FlatButton(
          //   child: Text('Next'),
          //   textColor: Colors.white,
          //   onPressed: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => HomePage()),
          //     );
          //   },
          // )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfff7f6fb),
              Color(0xfff7f6fb),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // child: Padding(
        //         padding: EdgeInsets.only(left: 28, right: 16, top: 16),
        //         child: TextFormField(
        //           // initialValue: widget.user.condition,
        //           // onSaved: (val) => widget.user.condition = val!,
        //           validator: (val) =>
        //               val!.length > 3 ? null : 'Condition name is invalid',
        //           decoration: InputDecoration(
        //             labelText: 'Name',
        //             hintText: 'Enter Your Name',
        //             icon: Icon(Icons.medical_services),
        //             isDense: true,
        //           ),
        //         ),
        //       ),
        child: users.length <= 0
            ? Center(
                child: EmptyState(
                  title: 'No data added..',
                  message: 'Add form by tapping add button below',
                ),
              )
            : ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: users.length,
                itemBuilder: (_, i) => users[i],
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          // label: const Text("Add Medical Data +"),
          label: Text("Add Medical Data"),
          icon: Icon(Icons.add),
          onPressed: onAddForm,
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF586894)),
    );
  }

  ///on form user deleted
  void onDelete(User _user) {
    setState(() {
      var find = users.firstWhere(
        (it) => it.user == _user,
        // orElse: () => null,
      );
      if (find != null) users.removeAt(users.indexOf(find));
    });
  }

  ///on add form
  void onAddForm() {
    setState(() {
      var _user = User();
      users.add(UserForm(
        user: _user,
        onDelete: () => onDelete(_user),
      ));
    });
  }

  ///on save forms
  Future<void> onSave() async {
    if (users.length > 0) {
      var allValid = true;
      users.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = users.map((it) => it.user).toList();
        print(users);
        print("Just a devider");
        print(data);
        var no_condition = data.length.toString();
        print(no_condition);
        final rawJson = jsonEncode(data);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setStringList(medical_hsitory_data, value)
        prefs.setString('medical_history', rawJson);
        prefs.setString('no_condition', no_condition);
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
    }
  }
}
