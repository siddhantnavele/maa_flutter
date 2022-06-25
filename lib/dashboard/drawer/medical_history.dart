import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class medical_history extends StatefulWidget {
  medical_history({Key? key}) : super(key: key);

  @override
  State<medical_history> createState() => _medical_historyState();
}

class _medical_historyState extends State<medical_history> {
  // List<String> medical_history = [];
  String medical_history = '';

  @override
  void initState() {
    // viewphoneNumber().then(updatephone);

    super.initState();

    _loadCounter();
    // getData();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      medical_history = prefs.getString('medical_history') ?? '';
      // List<String> medical_history = jsonDecode(rawJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Medical History'),
      ),
      body: Center(child: Text(medical_history)),
    );
  }
}
