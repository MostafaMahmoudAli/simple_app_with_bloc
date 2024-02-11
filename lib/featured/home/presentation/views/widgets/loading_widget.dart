import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget
{
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
         start:4.0.w,end:4.0.w,bottom:4.0.h,top:4.0.h,
        ),
        child: SizedBox(
          height: 30.0.h,
          width: 30.0.w,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
