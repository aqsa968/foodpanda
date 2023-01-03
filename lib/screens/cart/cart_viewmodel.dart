
import 'package:foodpanda/helper/GlobalVariable.dart';
import 'package:foodpanda/screens/cart/cart_model.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  RxDouble totalPrice = 0.0.obs;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    calculateTotal();
  }

  deleteProduct(int index) {
   // db.removeCartItem(GlobalVariables.cartList[index].id!);
    GlobalVariables.cartCount.value -=
        GlobalVariables.cartList[index].quantity!;
    GlobalVariables.cartList.removeAt(index);
    calculateTotal();
  }

  incrementProduct(int index) {
    CartModel model = GlobalVariables.cartList[index];
    model.quantity = (model.quantity! + 1);
    GlobalVariables.cartList[index] = model;
  //  db.updateCartItem(model);
    GlobalVariables.cartCount.value++;
    calculateTotal();
  }

  decrementProduct(int index) {
    if (GlobalVariables.cartList[index].quantity != 1) {
      CartModel model = GlobalVariables.cartList[index];
      model.quantity = (model.quantity! - 1);
      GlobalVariables.cartList[index] = model;

    } else {
      deleteProduct(index);
    }
    GlobalVariables.cartCount.value--;
    calculateTotal();
  }

  calculateTotal() {
    // totalPrice.value = GlobalVariables.cartList.fold(0, (sum, next) {
    //   return sum + (double.parse(next.price!) * next.quantity!);
    // });
  }
}
