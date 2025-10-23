import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamel_fibo/core/styling/app_colors.dart';

class Customtextfield extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final String? Toplabel;
  final String? hintText;
  final Widget? suffix;
  final bool ispassword;

  const Customtextfield({
    super.key,
    this.controller,
    this.hintText,
    this.label,
    this.validator,
    this.Toplabel,
    this.suffix,
    this.ispassword = false,
  });

  @override
  State<Customtextfield> createState() => _CustomtextfieldState();
}

class _CustomtextfieldState extends State<Customtextfield> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          if (widget.Toplabel != null) ...[
            Text(
              "${widget.Toplabel}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 3),
          ],
          SizedBox(
            width: 341.w,
            height: 52.h,
            child: TextFormField(
              obscureText: widget.ispassword ? isObsecure : false,
              validator: widget.validator,
              controller: widget.controller,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: AppColors.hintColor),
                labelStyle: TextStyle(color: AppColors.hintColor),
                label: Text("${widget.label}"),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: widget.hintText,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                    width: 2.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                    width: 2.w,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: AppColors.errorBorderColor,
                    width: 2.w,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.errorBorderColor,
                    width: 2.w,
                  ),
                ),
                suffixIcon:
                    widget.ispassword
                        ? IconButton(
                          onPressed: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                          icon:
                              isObsecure
                                  ? Icon(
                                    Icons.visibility_off_outlined,
                                    color: AppColors.hintColor,
                                  )
                                  : Icon(
                                    Icons.visibility_off_outlined,
                                    color: AppColors.hintColor,
                                  ),
                        )
                        : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
