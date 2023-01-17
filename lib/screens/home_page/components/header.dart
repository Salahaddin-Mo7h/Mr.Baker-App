import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr.baker_application/controllers/cart_product_controller.dart';
import 'package:mr.baker_application/controllers/popular_product_controller.dart';
import 'package:mr.baker_application/controllers/recommended_product_controller.dart';
import 'package:mr.baker_application/routes.dart';
import 'package:mr.baker_application/screens/home_page/components/iconandtext.dart';
import 'package:get/get.dart';

Widget header(BuildContext context) {
  var product = Get.find<RecommendedProductController>()
      .RecommendedProductListData[1];
  Get.find<PopularProductController>()
      .setInitQuantity(product, Get.find<CartProductController>());
  return Container(
    margin: EdgeInsets.only(left: 10.w, right: 15.w, bottom: 8.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.arrow_back,size: 30.w,color: Colors.orange,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mr.Baker",
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(0.8.w),
                  padding: EdgeInsets.all(0.8.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2)
                  ),
                  child: Container(
                    child: IconAndTextWidget(
                      context: context,
                      title: "Closing in 20 Min",
                      iconData: Icons.access_time_sharp,
                      iconColor: Colors.teal,
                    ),
                  ),
                ),
                SizedBox(width: 5.w,),
                Container(
                  margin: EdgeInsets.all(0.8.w),
                  padding: EdgeInsets.all(0.8.w),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2)
                  ),
                  child: IconAndTextWidget(
                    context: context,
                    title: "15 min to pick up",
                    iconData: Icons.location_on,
                    iconColor: Colors.teal,
                  ),
                ),
              ],
            ),
          ],
        ),
        GetBuilder<PopularProductController>(builder: (value) {
          return GestureDetector(
            onTap: () {
              if (value.totalItems >= 1) {
                Get.toNamed(AppRoutes.getCartPage());
              }else{
                Get.snackbar("Message",
                    "Your Cart is empty try to add some items!!! ");
              }
            },
            child: Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: Badge(
                badgeColor: Colors.white,
                padding: EdgeInsets.zero,
                badgeContent: value.totalItems >= 1
                    ? AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 25.w,
                  height: 25.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orangeAccent,
                  ),
                  child: Center(
                      child: Text(
                        Get.find<PopularProductController>()
                            .totalItems
                            .toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )),
                )
                    : Container(),
                animationType: BadgeAnimationType.slide,
                child: const Center(
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        }),

      ],
    ),
  );
}
