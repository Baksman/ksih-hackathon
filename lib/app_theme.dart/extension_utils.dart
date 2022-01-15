import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ThemeExtension on BuildContext {
  TextTheme get getTextContext => Theme.of(this).textTheme;
  get getTheme => Theme.of(this);
}

extension MediaQueryExt on BuildContext {
  double get getDeviceWidth => MediaQuery.of(this).size.width;
  double get getDeviceHeight => MediaQuery.of(this).size.height;
}

extension DoubleExtension on num {
  // use for all static height throughout the entire app
  // ignore: unnecessary_cast
  double get flexibleHeight => ScreenUtil().setHeight(this);

  // use for all static width throughout the entire app
  // ignore: unnecessary_cast
  double get flexibleWidth => ScreenUtil().setWidth(this) as double;
  // use for all font size throughout the entire app
  // ignore: unnecessary_cast
  double get flexibleFontSize => ScreenUtil().setSp(this) as double;

  /// Use to add horizontal space
  // ignore: unnecessary_cast
  SizedBox get horizontalSpace => SizedBox(width: flexibleWidth);
  // Use to add vertical space
  SizedBox get verticalSpace => SizedBox(height: flexibleHeight);

  // String timeAgo({bool short = false}) {
  //   final duration = DateTime.now()
  //       // ignore: avoid_as
  //       .difference(DateTime.fromMillisecondsSinceEpoch(this as int));
  //   final dateTime = DateTime.now().subtract(duration);
  //   final time = short
  //       ? timeago.format(dateTime, locale: 'en_short')
  //       : timeago.format(dateTime);
  //   return time;
  // }

  // String formatDateWith(int? endDate) {
  //   if (endDate != null) {
  //     //

  //     final start = DateTime.fromMillisecondsSinceEpoch(this as int).toLocal();
  //     final end = DateTime.fromMillisecondsSinceEpoch(endDate).toLocal();

  //     if (start.month == end.month) {
  //       if (start.day == end.day) {
  //         return DateFormat('MMMM d, y').format(start);
  //       }
  //       return DateFormat('MMMM d').format(start) +
  //           DateFormat('-d, y').format(end);
  //     } else {
  //       final date = DateFormat('MMMM d - ').format(start) +
  //           DateFormat('MMMM d, y').format(start);
  //       return date;
  //     }
  //   }
  //   return '';
  // }
}
