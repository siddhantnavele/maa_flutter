import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maa/dashboard/drawer/medical_history.dart';
import 'package:maa/faq/faq_new.dart';
import 'package:maa/info/home_page.dart';
import 'package:maa/login/register1.dart';
import 'package:maa/new_form/hive_form.dart';
import 'package:maa/new_form/hive_form_read.dart';
import 'package:maa/onboard/onboard.dart';
import 'package:maa/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../faq/faq.dart';

class MainDrawer extends StatelessWidget {
  final String phone;
  final String name;
  MainDrawer(this.phone, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      // height: 378,
      // transform: Matrix4.translationValues(0.0, -169.0, 0.0),
      child: Drawer(
        backgroundColor: Colors.black87,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 107,
              padding:
                  EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 30),
              color: Color.fromARGB(255, 192, 224, 236),
              child: Center(
                child: Column(
                  children: <Widget>[
                    // Container(
                    //   width: 110,
                    //   height: 100,
                    //   margin: EdgeInsets.only(top: 20, bottom: 20),
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     image: DecorationImage(
                    //       image: NetworkImage(
                    //           'https://avatars.githubusercontent.com/u/11042297?v=4'),
                    //       fit: BoxFit.fill,
                    //     ),
                    //   ),
                    // ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      phone,
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                Icons.call,
                color: Colors.white,
              ),
              title: Text(
                "Ambulance",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            Divider(
              thickness: 1,
              color: Colors.white30,
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.info,
                color: Colors.white,
              ),
              title: Text(
                "Info",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            Divider(
              thickness: 1,
              color: Colors.white30,
            ),
            ListTile(
              leading: Icon(
                Icons.people_outline_sharp,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            Divider(
              thickness: 1,
              color: Colors.white30,
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.white,
              ),
              title: Text(
                "Medical History",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => hiveformread()));
                // hiveform
                // medical_history
              },
            ),
            Divider(
              thickness: 1,
              color: Colors.white30,
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer_rounded,
                color: Colors.white,
              ),
              title: Text(
                "FAQ",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => faqnew()));
              },
            ),
            Divider(
              thickness: 1,
              color: Colors.white30,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            // Divider(
            //   thickness: 1,
            //   color: Colors.white30,
            // ),
            SizedBox(height: 174.5),
            Divider(
              thickness: 1,
              color: Colors.white30,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () async {
                SharedPreferences userData =
                    await SharedPreferences.getInstance();
                await userData.clear();

                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => OnBoard()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
