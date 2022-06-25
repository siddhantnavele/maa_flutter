// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:maa/multiform.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

// class Otp extends StatefulWidget {
//   String phoneController;
//   String verificationID;
//   Otp({required this.phoneController, required this.verificationID});

//   @override
//   _OtpState createState() => _OtpState(
//       phoneController: phoneController, verificationID: verificationID);
// }

// class _OtpState extends State<Otp> {
//   String verificationID;
//   String phoneController;

//   _OtpState({required this.phoneController, required this.verificationID});
//   FirebaseAuth auth = FirebaseAuth.instance;

//   OtpFieldController otpController = OtpFieldController();

//   get verificationId => null;

//   void signInWithPhoneAuthCredential(
//       PhoneAuthCredential phoneAuthCredential) async {
//     try {
//       final authCredential =
//           await auth.signInWithCredential(phoneAuthCredential);

//       if (authCredential.user != null) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => MultiForm()));
//       }
//     } on FirebaseAuthException catch (e) {
//       print("catch");
//     }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Color(0xfff7f6fb),
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Icon(
//                       Icons.arrow_back,
//                       size: 32,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//                 Container(
//                   width: 200,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurple.shade50,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Image.asset(
//                     'assets/images/illustration-3.png',
//                   ),
//                 ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Text(
//                   'Verification',
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Enter your OTP code number",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black38,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 28,
//                 ),
//                 Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(28),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                   child: Column(
//                     children: [
//                       Visibility(
//                         // visible: otpCodeVisible,
//                         child: OTPTextField(
//                           controller: otpController,
//                           length: 6,
//                           width: MediaQuery.of(context).size.width,
//                           textFieldAlignment: MainAxisAlignment.start,
//                           fieldWidth: 33,
//                           fieldStyle: FieldStyle.underline,
//                           outlineBorderRadius: 15,
//                           style: TextStyle(
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           // onChanged: (pin) {
//                           //   print("Changed: " + pin);
//                           // },
//                           // onCompleted: (pin) {
//                           //   print("Completed: " + pin);
//                           // }
//                         ),
//                       ),
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //   mainAxisSize: MainAxisSize.min,
//                       //   children: [
//                       //     OTPTextField(
//                       //       controller: otpController,
//                       //       length: 5,
//                       //       width: MediaQuery.of(context).size.width,
//                       //       textFieldAlignment: MainAxisAlignment.spaceAround,
//                       //       fieldWidth: 55,
//                       //       fieldStyle: FieldStyle.box,
//                       //       outlineBorderRadius: 15,
//                       //       style: TextStyle(fontSize: 17),
//                       //       onChanged: (pin) {
//                       //         print("Changed: " + pin);
//                       //       },
//                       //       onCompleted: (pin) {
//                       //         print("Completed: " + pin);
//                       //       }),
//                       //   ],

//                       // children: [
//                       //   // _textFieldOTP(first: true, last: false),
//                       //   // _textFieldOTP(first: false, last: false),
//                       //   // _textFieldOTP(first: false, last: false),
//                       //   // _textFieldOTP(first: false, last: true),
//                       // ],
//                       // ),
//                       SizedBox(
//                         height: 22,
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                   builder: (context) => MultiForm()),
//                             );
//                           },
//                           style: ButtonStyle(
//                             foregroundColor:
//                                 MaterialStateProperty.all<Color>(Colors.white),
//                             backgroundColor:
//                                 MaterialStateProperty.all<Color>(Colors.purple),
//                             shape: MaterialStateProperty.all<
//                                 RoundedRectangleBorder>(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(24.0),
//                               ),
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.all(14.0),
//                             child: Text(
//                               'Verify',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//                 Text(
//                   "Didn't you receive any code?",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black38,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 18,
//                 ),
//                 Text(
//                   "Resend New Code",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.purple,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }

//     //   Future<void> verify() async {
//     //     PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
//     //         verificationId: verificationId, smsCode: otpController.text);

//     //     signInWithPhoneAuthCredential(PhoneAuthCredential);
//     //   }
//     // }

//     // Future<Void> verified() async {
//     //   PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
//     //       verificationId: verificationId, smsCode: otpController.toString());
//     // }

//     @override
//     noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
//   }
// // }

// import 'package:maa/info/data.dart';

// late final PlanetInfo platnetInfo;
