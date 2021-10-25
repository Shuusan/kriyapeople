import 'package:get/get.dart';
import 'package:kryia_people/models/cart_product.dart';

class CartController extends GetxController {
  RxList<CartProducts> chosenProduct = List<CartProducts>.empty().obs;

  final RxBool _showCart = false.obs;
  set showCart(bool value) => this._showCart.value = value;
  bool get showCart => this._showCart.value;

  final RxInt _totalProductInCart = 0.obs;
  set totalProductInCart(int value) => this._totalProductInCart.value = value;
  int get totalProductInCart => this._totalProductInCart.value;

  void addProduct(String productName) {
    int productIndex = chosenProduct.indexWhere((element) => element.productName == productName);
    totalProductInCart++;
    if (productIndex == -1) {
      chosenProduct.add(CartProducts(productName: productName, quantity: 1));
    } else {
      chosenProduct[productIndex] = CartProducts(productName: productName, quantity: chosenProduct[productIndex].quantity + 1);
    }
  }

  void removeProduct(String productName) {
    int productIndex = chosenProduct.indexWhere((element) => element.productName == productName);
    totalProductInCart--;
    if (totalProductInCart == 0) {
      showCart = false;
    }
    if (chosenProduct[productIndex].quantity == 1) {
      chosenProduct.removeAt(productIndex);
    } else {
      chosenProduct[productIndex] = CartProducts(productName: productName, quantity: chosenProduct[productIndex].quantity - 1);
    }
  }

  void cartVisible() {
    if (chosenProduct.length == 0) {
      showCart = false;
    } else {
      showCart = true;
    }
  }

  void clearProduct() {
    chosenProduct.clear();
    showCart = false;
    totalProductInCart = 0;
  }
}
