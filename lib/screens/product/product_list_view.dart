import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodpanda/helper/GlobalVariable.dart';
import 'package:foodpanda/screens/cart/cart_view.dart';
import 'package:foodpanda/screens/product/product_list_viewmodel.dart';
import 'package:foodpanda/widget/custom_buttons.dart';
import 'package:foodpanda/widget/custom_textfield.dart';
import 'package:get/get.dart';

class ProductListView extends StatelessWidget {
  ProductListView({Key? key}) : super(key: key);
  final ProductListViewModel viewModel = Get.put(ProductListViewModel());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar(),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("foodpanda").snapshots(),
          builder: (context, snapshot) {
            return Column(
              children: [
                SearchTextField(
                  controller: viewModel.searchTxtField,
                  hintText: 'Search By Name',
                  onFieldSubmitted: (value) {
                    viewModel.imagesList.clear();
                    viewModel.searchByName(value);
                    // searchViewModel.resetFilter();
                    // searchViewModel.searchProducts();
                  },
                ),
                Flexible(
                  child: Obx(
                    () => MasonryGridView.count(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemCount: viewModel.imagesList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(CartView());
                            },
                            child: Column(
                              children: [
                                GridTile(
                                  child: Image.network(
                                      viewModel.imagesList[index].url ?? ""),
                                ),
                                Text(viewModel.imagesList[index].name ?? ""),
                                addToCartButton(index),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            );
          }),
    ));
  }

  Widget addToCartButton(int index) {
    return CustomElevatedBtn(
      height: 29.5,
      backgroundColor: const Color(0xffba8d7d),
      radius: 4.5,
      child: const Text(
        'Add to Cart',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      onPressed: () {
        viewModel.addToCart(index);
      },
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Image(
        height: 28,
        width: 28,
        image: AssetImage('assets/foodpanda.jpg'),
        // fit: BoxFit.contain,
      ),
      actions: [
        Obx(
          () => Badge(
            showBadge: (GlobalVariables.cartCount.value > 0) ? true : false,
            position: BadgePosition.topEnd(top: 10, end: 6),
            badgeContent: Text(
              GlobalVariables.cartCount.value.toString(),
              style: const TextStyle(
                fontSize: 8,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            child: IconButton(
              onPressed: () {
                Get.to(() => CartView());
              },
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.pink,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
