import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kryia_people/models/product.dart';
import 'package:kryia_people/services/product_services.dart';

class ProductController extends GetxController {
  RxList<ItemResponse> productData = List<ItemResponse>.empty().obs;

  @override
  void onInit() async {
    await fetchProduct();
    super.onInit();
  }

  Future<void> fetchProduct() async {
    await ProductServices.fetchTitleProduct().then((value) {
      if (value == null) {
        Get.snackbar("Fetch Product Failed", "Fetch product failed, please check your internet connection",
            colorText: Colors.white, backgroundColor: Colors.black);
      } else {
        productData.value = value;
      }
    });
  }
}
