import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Primarybutton extends StatelessWidget {
  final String? buttonText;
  final Widget? text;
  final Function()? onpress;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final double? fontsize;
  final FontWeight? fontweight;
  final Color? color;
  const Primarybutton({
    super.key,
    this.text,
    this.onpress,
    this.backgroundColor,
    this.borderRadius,
    this.width,
    this.height,
    this.buttonText,
    this.fontsize,
    this.fontweight, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        "$buttonText",
        style: TextStyle(
          fontSize: fontsize,
          fontWeight: fontweight,
          color: color,
        ),
      ),
    );
  }
}

