import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodpanda/helper/GlobalVariable.dart';
import 'package:foodpanda/screens/cart/cart_model.dart';
import 'package:foodpanda/screens/product/product_list_model.dart';
import 'package:get/get.dart';

class ProductListViewModel extends GetxController {
  dynamic querySnapshot;
  FirebaseStorage storage = FirebaseStorage.instance;
  TextEditingController searchTxtField = TextEditingController();
  static late Future<ListResult> listResult;
  RxList<ImagesModel> imagesList = <ImagesModel>[].obs;
  static int? length;

  @override
  void onInit() {
    super.onInit();
    //imagesList.clear();
    //  getImages();
    getList();
  }

  getList() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference collectionReference =
        firestore.collection('foodpanda');
    await collectionReference.orderBy('name').get().then((value) {
      imagesList.addAll(value.docs
          .map((e) => ImagesModel.fromJson(e.data() as Map<String, dynamic>)));
    });
  }

  addToCart(int index) {
    int valueIndex = GlobalVariables.cartList.indexWhere(
      (item) => item.id == imagesList[index].name,
    );

    if (valueIndex != -1) {
      CartModel model = GlobalVariables.cartList[valueIndex];
      model.quantity = (model.quantity! + 1);
      GlobalVariables.cartList[valueIndex] = model;
      // db.updateCartItem(model);
    } else {
      CartModel model = CartModel(
        quantity: 1,
        image: imagesList[index].url,
        name: imagesList[index].name

      );
      GlobalVariables.cartList.add(model);
    }

    GlobalVariables.cartCount.value++;
  }

  void searchByName(String searchValue) async {
    FirebaseFirestore.instance
        .collection('foodpanda')
        .snapshots()
        .listen((value) {
      imagesList.clear();
      for (int i = 0; i < value.docs.length; i++) {
        ImagesModel model = ImagesModel.fromJson(value.docs[i].data());
        if (model.name?.startsWith(searchValue) ?? false) {
          imagesList.add(ImagesModel.fromJson(value.docs[i].data()));
        }
      }
    });
    //  imagesList.add(documentData);
  }
}
