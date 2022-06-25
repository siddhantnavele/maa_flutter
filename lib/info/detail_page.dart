import 'package:flutter/material.dart';
import 'package:maa/info/data.dart';
import 'constants.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key? key, required this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 300),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Chronic Disease',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 31,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const Divider(color: Colors.black38),
                        const SizedBox(height: 32),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: const Text(
                            'Description',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 25,
                              color: Color(0xff47455f),
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          planetInfo.description,
                          maxLines: 100,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Divider(color: Colors.black38),
                        const SizedBox(height: 32),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: const Text(
                            'Precautions',
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 25,
                              color: Color(0xff47455f),
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          planetInfo.precautions,
                          maxLines: 100,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 32.0),
                  //   child: Text(
                  //     'Gallery',
                  //     style: TextStyle(
                  //       fontFamily: 'Avenir',
                  //       fontSize: 25,
                  //       color: Color(0xff47455f),
                  //       fontWeight: FontWeight.w300,
                  //     ),
                  //     textAlign: TextAlign.left,
                  //   ),
                  // ),
                  // Container(
                  //   height: 250,
                  //   padding: const EdgeInsets.only(left: 32.0),
                  //   child: ListView.builder(
                  //       itemCount: planetInfo.images.length,
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return Card(
                  //           clipBehavior: Clip.antiAlias,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(24),
                  //           ),
                  //           child: AspectRatio(
                  //               aspectRatio: 1,
                  //               child: Image.network(
                  //                 planetInfo.images[index],
                  //                 fit: BoxFit.cover,
                  //               )),
                  //         );
                  //       }),
                  // ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            // Positioned(
            //   right: -64,
            //   child: Hero(
            //       tag: planetInfo.position,
            //       child: Image.asset(planetInfo.iconImage)),
            // ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(
                planetInfo.position.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 247,
                  color: primaryTextColor.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
