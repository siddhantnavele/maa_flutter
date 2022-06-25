import 'package:flutter/material.dart';
import 'package:maa/dashboard/dash_home.dart';

import 'package:maa/info/home_page.dart';

import 'package:maa/dashboard/drawer/main_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maa/login/register1.dart';
import 'package:maa/login/welcome.dart';
import 'package:maa/screen/list.dart';
import 'package:maa/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:maa/new_form/main_form.dart';
import '../new_form/modal_form/user.dart';
import 'drawer/main_drawer.dart';
import 'drawer/main_drawer.dart';

class dashboard extends StatefulWidget {
  // late final List<User> userList;
  // dashboard(this.userList);
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  String phoneNumber = "";
  String name = "";
  String age = "";
  String height = "";
  String weight = "";
  int selectedIndex = 0;
  int tabselected = 0;

  // List<> userlist = Widget.userList;
  // late final List<User> userList;
  final pages = [
    HorizontalListPage(),
  Data(),
    // HomePage123(),
  ];

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
      phoneNumber = (prefs.getString('phoneNumber') ?? '');
      name = (prefs.getString('name') ?? '');
      age = (prefs.getString('age') ?? '');
      height = (prefs.getString('height') ?? '');
      weight = (prefs.getString('weight') ?? '');
    });
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    // if (hour < 21) {
    //   return 'Good Evening';
    // }
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            greeting() + ", " + name,
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        // leading: IconButton(
        //   icon: const Icon(Icons.search),
        //   onPressed: () {},
        // ),
        // actions: <Widget>[
        //   // Padding(
        //   //   padding: const EdgeInsets.only(right: 50.0),
        //   //   child: IconButton(
        //   //     icon: Icon(Icons.search),
        //   //     onPressed: () {},
        //   //   ),
        //   // ),
        //   Padding(
        //     padding: const EdgeInsets.only(bottom: 150),
        //     child: IconButton(
        //       icon: Icon(Icons.list_outlined),
        //       onPressed: () {
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) => MainDrawer(phoneNumber, name)));
        //         // Scaffold.of(context).MainDrawe;
        //       },
        //     ),
        //   )
        // ],
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0))),
        // backgroundColor: Color.fromARGB(255, 21, 209, 223),
        backgroundColor: const Color.fromARGB(255, 192, 224, 236),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      endDrawer: MainDrawer(phoneNumber, name),
      extendBodyBehindAppBar: true,
      body: Container(
        child: pages[tabselected],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Color.fromARGB(255, 190, 220, 245),
          backgroundColor: Colors.white24,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        child: NavigationBar(
          height: 65,
          selectedIndex: tabselected,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (index) {
            setState(() {
              tabselected = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.home),
              label: 'Home',
              // selectedIcon: Icon(Icons.home_outlined),
            ),
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.hospital),
              label: 'Hospital',
              // selectedIcon: Icon(Icons.camera_alt_outlined),
            ),
            // NavigationDestination(
            //   icon: FaIcon(FontAwesomeIcons.stethoscope),
            //   label: 'Doctor',
            //   // selectedIcon: Icon(Icons.info_rounded),
            // ),
          ],
        ),
      ),
    );
  }
}
