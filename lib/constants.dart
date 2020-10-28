import 'package:flutter/material.dart';

const kWhitColor = Color(0xFFFFFFFF);
const kBackgoundColor = Color(0xFFF5F5F5);
const kButtonColor = Color(0XFF21A29D);
const kPrimaryColor = Color(0xFFEB7201);
const kBlackColor = Color(0xFF333333);
const kBlackLightColor = Color(0xFF444444);

const kSnigletFont = TextStyle(fontFamily: "Sniglet");

//   return (index == items.length)
//       ? Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: RaisedButton(
//             color: kButtonColor,
//             textColor: kWhitColor,
//             child: Text("Load More"),
//             onPressed: () {
//               setState(() {
//                 if ((present + perPage) >
//                     originalItems.length) {
//                   items.addAll(originalItems.getRange(
//                       present, originalItems.length));
//                 } else {
//                   items.addAll(originalItems.getRange(
//                       present, present + perPage));
//                 }
//                 present = present + perPage;
//               });
//             },
//           ),
//         )
//       : Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: BookListCard(
//             press: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BookDetailsScreen(),
//                 ),
//               );
//             },
//             edition: 5,
//             auths:
//                 "Charles K. Alexander, Mathew N. O. Sadiku, Charles K. Alexander",
//             name: "Fundamentals of Electric Circuits",
//             poster:
//                 'https://cs.cheggcdn.com/covers2/29180000/29182981_1375631097_Width200.jpg',
//           ),
//         );
