import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/ContainerTheme.dart';
import '../widgets/textTheme.dart';

class ProductDetails extends StatelessWidget {
  var title;

  var phone;

  var Address;

  var dis;

  var pin;

  var sta;
  var dir;
  var wib;

  ProductDetails({
    Key? key,
    required this.title,
    required this.phone,
    required this.Address,
    required this.dis,
    required this.pin,
    required this.sta,
    required this.dir,
    required this.wib,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

// body
  _body() {
    return Stack(
      children: [background(), back(), bottomDetailsSheet()],
    );
  }

// It contains img and color
  background() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Image(
        image: AssetImage('assets/1.jpg'),
        fit: BoxFit.fill,
      ),
    );
  }

// back button
  back() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SafeArea(
          child: InkWell(
              onTap: () {
                Get.back();
              },
              child: ButtonTheme1(
                  icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )))),
    );
  }

// buttom Sheet
  bottomDetailsSheet() {
    return FadeInUp(
      // duration: Duration(milliseconds: 1400),
      child: DraggableScrollableSheet(
        initialChildSize: .3,
        minChildSize: .1,
        maxChildSize: .7,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 190, 244, 255),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60))),
              child: ListView(
                controller: scrollController,
                children: [
                  _indicator(),
                  const SizedBox(
                    height: 40,
                  ),
                  _titlePrice(),
                  Divider(
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  _color(),
                  const SizedBox(
                    height: 20,
                  ),
                  _address(),
                  const SizedBox(
                    height: 20,
                  ),
                  _district(),
                  const SizedBox(
                    height: 20,
                  ),
                  _state(),
                  const SizedBox(
                    height: 20,
                  ),
                  _pincode(),
                  const SizedBox(
                    height: 20,
                  ),
                  _wibsite(),
                  const SizedBox(
                    height: 20,
                  ),
                  _dir()
                ],
              ));
        },
      ),
    );
  }

// Color line in the sheet
  _indicator() {
    return Container(
      margin: const EdgeInsets.only(left: 150, right: 150),
      height: 5,
      color: Color.fromARGB(255, 7, 147, 255),
    );
  }

// title and price
  _titlePrice() {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: SizedBox(
        width: 170,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Colors.black),
        ),
      ),
    );
  }

// available color
  _color() {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        children: [
          TextTitle2(title: "Phone:-"),
          SizedBox(
              width: 170,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: TextTitle2(title: phone),
              )),
        ],
      ),
    );
  }

  _address() {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextTitle2(title: "Address:-"),
          SizedBox(
              width: 170,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextTitle2(title: "${Address}"),
              )),
        ],
      ),
    );
  }

  _district() {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        children: [
          TextTitle2(title: "District:-"),
          SizedBox(
              width: 170,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextTitle2(title: "${dis}"),
              )),
        ],
      ),
    );
  }

  _state() {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        children: [
          TextTitle2(title: "State:-"),
          SizedBox(
              width: 170,
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: TextTitle2(title: "${sta}"),
              )),
        ],
      ),
    );
  }

  _pincode() {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        children: [
          TextTitle2(title: "PinCode:-"),
          SizedBox(
              width: 170,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextTitle2(title: "${pin}"),
              )),
        ],
      ),
    );
  }

  _wibsite() {
    return InkWell(
      onTap: () {
        _launchInBrowser(Uri.parse(wib));
      },
      child: Container(
          margin: const EdgeInsets.only(left: 50, right: 50),
          child: Row(
            children: [
              TextTitle2(title: "Website:-"),
              SizedBox(
                  width: 170,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextTitle2(title: "${wib}"),
                  )),
            ],
          )),
    );
  }

  _dir() {
    return MaterialButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.navigation),
            TextTitle2(title: "Get Direction")
          ],
        ),
        onPressed: () {
          _launchInBrowser(Uri.parse(
              'https://www.google.com/maps/dir/?api=1&destination=${dir}&travelmode=driving&dir_action=navigate'));
        });
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw 'Could not launch $url';
    }
  }
}
