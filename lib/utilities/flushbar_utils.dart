import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowFlushBar {
  final String title;
  final BuildContext context;
  final String subtitle;
  final Color? color;
  final int? duration;

  factory ShowFlushBar.showSuccessFlushBar(
      {required String title,
      required BuildContext context,
      required String subtitle,
      FlushbarPosition? position,
      int? duration}) {
    return ShowFlushBar(
      context: context,
      title: title,
      subtitle: subtitle,
      color: kCupertinoModalBarrierColor,
      duration: duration,
      position: position,
    );
  }

  ShowFlushBar(
      {required this.title,
      required this.context,
      required this.subtitle,
      FlushbarPosition? position,
      this.color,
      this.duration}) {
    _showFlush(
        context: context,
        title: title,
        color: color,
        position: position,
        subtitle: subtitle,
        duration: duration);
  }

  _showFlush(
      {required String title,
      required BuildContext context,
      required String subtitle,
      FlushbarPosition? position,
      Color? color,
      int? duration}) {
    Flushbar(
      backgroundColor: color ?? Colors.red,
      duration: Duration(seconds: duration ?? 5),
      title: title,
      isDismissible: true,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      messageText: Text(subtitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          )),
      flushbarPosition: position ?? FlushbarPosition.TOP,
    ).show(context);
  }
}



// import 'package:hara/utils/color_utils.dart';


