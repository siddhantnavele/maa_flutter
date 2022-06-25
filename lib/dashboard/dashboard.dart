// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:maa/home_page.dart';

// class dashboard extends StatefulWidget {
//   dashboard({Key? key}) : super(key: key);

//   @override
//   State<dashboard> createState() => _dashboardState();
// }

// class _dashboardState extends State<dashboard> {
//   final _pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     // final _pageController = PageController();

//     // PageView(
//     //   controller: _pageController,
//     // );
//     int _selectedIndex = 0;

//     final List<Widget> _pages = <Widget>[
//       Icon(Icons.home, size: 30),
//       Icon(Icons.search, size: 30),
//       Icon(Icons.book, size: 30),
//       Icon(Icons.person, size: 30),
//     ];


    

//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         title: Text("Curved notification bar"),
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: PageView(
//           controller: _pageController,
//           children: <Widget>[
//             dashboard(),
//             HomePage(),
//           ],
//           onPageChanged: (int index) {
//             setState(() {
//               _pageController.jumpToPage(index);
//             });
//           }),
//       bottomNavigationBar: Theme(
//         data: Theme.of(context)
//             .copyWith(iconTheme: IconThemeData(color: Colors.black)),
//         child: CurvedNavigationBar(
//           backgroundColor: Colors.transparent,
//           height: 60,
//           // items: items,
//           onTap: (index) {
//             setState(() {
//               var _page = index;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
