import 'package:foodpanda/screens/cart/cart_model.dart';
import 'package:get/get.dart';

class GlobalVariables {
  static List<CartModel> cartList = <CartModel>[].obs;
  static RxInt cartCount = 0.obs;
}
