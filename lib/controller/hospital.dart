import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/apiConst.dart';
import '../model/hospital.dart';
import 'package:http/http.dart' as http;

class HospitalController extends GetxController {
  TextEditingController searchFiels = TextEditingController();
  List<Hospital>? hospitalmodel = [];
  List<Hospital>? hospitalmodel1 = [];
  List<Hospital>? hospitalmodel2 = [];
  List<Hospital>? hospitalmodel3 = [];
  String end = '0';

  List<Hospital>? get hospitalList {
    return hospitalmodel;
  }

  List<Hospital>? get hospitalList1 {
    return hospitalmodel1;
  }

  List<Hospital>? get hospitalList2 {
    return hospitalmodel2;
  }

  List<Hospital>? get hospitalList3 {
    return hospitalmodel3;
  }

  @override
  void onInit() {
    // TODO: implement onInit

    _getData();
    searchFiels.addListener(() {
      searchFiels.text.toLowerCase();
    });
    // state(int.parse(searchFiels.text));
    super.onInit();
  }


  _getData() async {
    hospitalmodel = await getHospital();
    hospitalmodel1 = await getHospital1();
    hospitalmodel2 = await getHospital2();
    hospitalmodel3 = await getHospital3();
    update();
  }

  Future<List<Hospital>?> getHospital() async {
    try {
      var url = Uri.parse(ApiConst.baseUrl + ApiConst.endpoint[0]);
      update();
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Hospital> hospitalModel = hospitalFromJson(response.body);
        return hospitalModel;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Hospital>?> getHospital1() async {
    try {
      var url = Uri.parse(ApiConst.baseUrl + ApiConst.endpoint[1]);
  
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Hospital> hospitalModel1 = hospitalFromJson(response.body);
        return hospitalModel1;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Hospital>?> getHospital2() async {
    try {
      var url = Uri.parse(ApiConst.baseUrl + ApiConst.endpoint[0]);
      update();
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Hospital> hospitalModel2 = hospitalFromJson(response.body);
        return hospitalModel2;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Hospital>?> getHospital3() async {
    try {
      var url = Uri.parse(ApiConst.baseUrl + ApiConst.endpoint[0]);
      update();
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Hospital> hospitalModel3 = hospitalFromJson(response.body);
        return hospitalModel3;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
