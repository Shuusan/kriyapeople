import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kryia_people/constants/colors.dart';
import 'package:kryia_people/controllers/_controllers.dart';
import 'package:kryia_people/views/page2.dart';

class Page1 extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: secondColor,
        title: Text(
          "Kyria Shop",
          style: Get.textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Column(
              children: [
                Obx(
                  () => AnimatedContainer(
                    onEnd: () {
                      cartController.cartVisible();
                    },
                    duration: Duration(milliseconds: 400),
                    width: Get.width,
                    height: cartController.chosenProduct.length != 0 ? Get.height * 0.175 : 0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, 1.0),
                        colors: [secondColor, thirdColor],
                        stops: [0.0, 1.0],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColors,
                          offset: Offset(0, 5),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: cartController.chosenProduct.length,
                                itemBuilder: (context, itemNumber) {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 20,
                                        child: Text(
                                          cartController.chosenProduct[itemNumber].productName,
                                          style: Get.textTheme.bodyText1!.copyWith(color: primaryColors),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(":", style: Get.textTheme.bodyText1!.copyWith(color: primaryColors)),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(cartController.chosenProduct[itemNumber].quantity.toString(),
                                            style: Get.textTheme.bodyText1!.copyWith(color: primaryColors)),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                          if (cartController.showCart == true)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 20,
                                    child: Text(
                                      "Total Product",
                                      style: Get.textTheme.headline2,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(":", style: Get.textTheme.headline2),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(cartController.totalProductInCart.toString(), style: Get.textTheme.headline2),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(() => Expanded(
                      child: productController.productData.length == 0
                          ? Center(child: Text("Please wait, fetch product data . . ."))
                          : ListView.builder(
                              itemCount: productController.productData.length + 1,
                              itemBuilder: (context, itemNumber) {
                                return itemNumber == productController.productData.length
                                    ? SizedBox(
                                        height: Get.height * 0.08,
                                      )
                                    : Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Obx(
                                              () => AnimatedContainer(
                                                duration: Duration(milliseconds: 300),
                                                width: Get.width * 0.625,
                                                height: Get.height * 0.1,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  color: cartController.chosenProduct.indexWhere((element) =>
                                                              element.productName == productController.productData[itemNumber].title) ==
                                                          -1
                                                      ? Colors.white
                                                      : primaryColors,
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
                                                      Text(productController.productData[itemNumber].title.substring(0, 10).toUpperCase(),
                                                          style: Get.textTheme.bodyText1),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 4.0),
                                                        child: Text(productController.productData[itemNumber].title,
                                                            maxLines: 1, overflow: TextOverflow.ellipsis, style: Get.textTheme.bodyText2),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Obx(
                                            () => Expanded(
                                              child: cartController.chosenProduct.indexWhere((element) =>
                                                          element.productName == productController.productData[itemNumber].title) ==
                                                      -1
                                                  ? IconButton(
                                                      onPressed: () {
                                                        cartController.addProduct(productController.productData[itemNumber].title);
                                                      },
                                                      icon: Icon(Icons.add_circle, color: thirdColor))
                                                  : Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        IconButton(
                                                            onPressed: () {
                                                              cartController.removeProduct(productController.productData[itemNumber].title);
                                                            },
                                                            icon: Icon(Icons.remove_circle, color: greyish)),
                                                        Text(
                                                            cartController
                                                                .chosenProduct[cartController.chosenProduct.indexWhere((element) =>
                                                                    element.productName == productController.productData[itemNumber].title)]
                                                                .quantity
                                                                .toString(),
                                                            style: Get.textTheme.bodyText1!
                                                                .copyWith(color: const Color(0xff010101), fontWeight: FontWeight.w700)),
                                                        IconButton(
                                                            onPressed: () {
                                                              cartController.addProduct(productController.productData[itemNumber].title);
                                                            },
                                                            icon: Icon(Icons.add_circle, color: thirdColor)),
                                                      ],
                                                    ),
                                            ),
                                          )
                                        ],
                                      );
                              },
                            ),
                    )),
              ],
            ),
            Obx(() => AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  bottom: cartController.chosenProduct.length == 0 ? -Get.height * 0.115 : Get.height * 0.015,
                  left: Get.width * 0.05,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => Page2());
                    },
                    child: Container(
                      width: Get.width * 0.9,
                      height: Get.height * 0.0575,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: thirdColor,
                      ),
                      child: Center(
                        child: Text('CHECKOUT', style: Get.textTheme.headline2),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
