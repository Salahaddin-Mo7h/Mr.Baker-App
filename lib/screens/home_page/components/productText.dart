import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row productText(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Product Category 1", style: Theme.of(context).textTheme.headline3),
      SizedBox(
        width: 22.w,
      ),
      Icon(
       Icons.keyboard_arrow_up_outlined,
        size: 24.sp,
        color: Colors.orange,
      )
    ],
  );
}

Row productText2(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Product Category 2", style: Theme.of(context).textTheme.headline3),
      SizedBox(
        width: 22.w,
      ),
      Icon(
        Icons.keyboard_arrow_up_outlined,
        size: 24.sp,
        color: Colors.orange,
      )
    ],
  );
}

Row productText3(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Product Category 3", style: Theme.of(context).textTheme.headline3),
      SizedBox(
        width: 22.w,
      ),
      Icon(
        Icons.keyboard_arrow_up_outlined,
        size: 24.sp,
        color: Colors.orange,
      )
    ],
  );
}