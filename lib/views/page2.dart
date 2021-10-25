import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kryia_people/constants/colors.dart';
import 'package:kryia_people/controllers/cart_controller.dart';

class Page2 extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        title: Text(
          "Kyria Shop",
          style: Get.textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            ListView.builder(
              itemCount: controller.chosenProduct.length + 1,
              itemBuilder: (context, itemNumber) {
                return itemNumber == controller.chosenProduct.length
                    ? SizedBox(
                        height: Get.height * 0.08,
                      )
                    : Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: Get.width * 0.8,
                              height: Get.height * 0.1,
                              decoration: BoxDecoration(
                                border: Border.all(color: primaryColors, width: 5),
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColors,
                                    offset: Offset(0, 2),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(controller.chosenProduct[itemNumber].productName.substring(0, 10), style: Get.textTheme.bodyText1),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(controller.chosenProduct[itemNumber].productName,
                                          maxLines: 1, overflow: TextOverflow.ellipsis, style: Get.textTheme.bodyText2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColors,
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColors,
                                    offset: Offset(0, 2),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    controller.chosenProduct[itemNumber].quantity.toString(),
                                    style: Get.textTheme.headline1!.copyWith(
                                      color: blackColors,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
              },
            ),
            Positioned(
              bottom: Get.height * 0.015,
              child: SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: Get.width * 0.4,
                        height: Get.height * 0.0575,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: blackColors,
                        ),
                        child: Center(
                          child: Text('BACK', style: Get.textTheme.headline2),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                            title: "Proceed Payment",
                            middleText: "Are you sure these are all the product you want to buy?",
                            onCancel: () {},
                            onConfirm: () {
                              controller.clearProduct();
                              Get.back(closeOverlays: true);
                            });
                      },
                      child: Container(
                        width: Get.width * 0.4,
                        height: Get.height * 0.0575,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: thirdColor,
                        ),
                        child: Center(
                          child: Text('BUY', style: Get.textTheme.headline2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
