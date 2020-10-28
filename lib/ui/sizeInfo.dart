import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study/enums/device_screen_type.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;
  SizingInformation({
    this.orientation,
    this.deviceType,
    this.screenSize,
    this.localWidgetSize,
  });
  // @override
  // String toString() {
  //   return 'Orientation:$orientation DeviceType:$deviceType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  // }
}

// Size screenSize(BuildContext context) {
//   return MediaQuery.of(context).size;
// }

// double screenHeight(BuildContext context, {double devidedBy = 1}) {
//   return screenSize(context).height / devidedBy;
// }

// double screenWidth(BuildContext context, {devidedBy = 1}) {
//   return screenSize(context).width / devidedBy;
// }
