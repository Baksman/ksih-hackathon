
import 'package:flutter/material.dart';
import 'package:new_hackathon/app_theme.dart/them_colors.dart';

class CustomRaisedButton extends StatelessWidget {
  final Color? color;
  final bool? isLoading;
  final Color? textColor;
  final double? width;
  final VoidCallback onPressed;
  final String title;
  final bool isActive;
   CustomRaisedButton(
      {this.color,
      this.textColor,
      required this.title,
      this.isLoading = false,
      this.isActive = true,
      this.width,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50,
        width: width,
        child: ElevatedButton(
          onPressed: (isLoading ?? false) ? null : onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: (isLoading ?? false)
                ? const SizedBox(
                    height: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    title,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              backgroundColor: MaterialStateProperty.all(isActive
                  ? (color ?? ThemeColor.appgreen)
                  : ThemeColor.appgreen.withOpacity(0.3))),
        ),
      ),
    );
  }
}
