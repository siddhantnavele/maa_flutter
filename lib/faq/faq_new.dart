import 'package:flutter/material.dart';

class faqnew extends StatefulWidget {
  faqnew({Key? key}) : super(key: key);

  @override
  State<faqnew> createState() => _faqnewState();
}

class _faqnewState extends State<faqnew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            "FAQ's",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0))),
        backgroundColor: const Color.fromARGB(255, 192, 224, 236),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: ExpansionTile(
                title: Text("What is the name of this application?"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "This Application is called Medical Aid Analayis, MAA"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: ExpansionTile(
                title: Text("Can We Find Hospitals over here?"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Yes, by searchign for your Chronic Disease you can find hospitals best suitable for it."),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: ExpansionTile(
                title: Text("Can We Find Doctors over here?"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Yes, by searchign for your Chronic Disease you can find Doctors best suitable for it."),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: ExpansionTile(
                title:
                    Text("What all Cities are included in this application?"),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Currently this application works for only Pune City. Soon we will be expanding it across the whole nation..."),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 100),
                  child: Container(
                    child: Text(
                      "Need more \nclarification?",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.black54),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Container(
                    child: Text(
                      "Send us your Questions and we can get back to you...",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.black38),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 15,
                    right: 20,
                  ),
                  child: TextField(
                    // onChanged: (value) {
                    //   name = value;
                    // },
                    // showCursor: false,

                    // cursorColor: Color(0xFF586894),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                      ),
                      hintText: "Write Your Query here.. ",

                      // enabledBorder: InputBorder.none,
                      // focusedBorder: InputBorder.none,
                    ),
                    style: TextStyle(height: 8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
