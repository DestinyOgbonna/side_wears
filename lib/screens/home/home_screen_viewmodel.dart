import 'dart:developer';

import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/model/product_model.dart';

class HomeScreenViewModel extends StateNotifier<HomeScreenState> {
  HomeScreenViewModel()
      : super(
          HomeScreenState(
            userModel: UserModel(),
            productModel: Product(),
          ),
        );
  final FirestoreCollectionService _firestoreCollectionService =
      FirestoreCollectionService();

  //**************************    Getting the user name of the logged in user   ***************

  Future getUsername() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.usersRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get() as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        state = state.copyWith(
          loadingState: LoadingState.loading,
        );
        final loggedInUsername = UserModel.fromFirestore(getUser);
        state = state.copyWith(
          loadingState: LoadingState.success,
          userModel: loggedInUsername,
        );
        return loggedInUsername;
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
  }

//********************     Getting Shoe Products Fromt the DB  ***********************

  Future<List<Product>> getShoeProducts() async {
    List<Product> products = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> getProducts =
          await _firestoreCollectionService.productsRef.get()
              as QuerySnapshot<Map<String, dynamic>>;
      if (getProducts.docs.isNotEmpty) {
        // state = state.copyWith(
        //   loadingState: LoadingState.loading,
        // );

        log('!!!!!!!!!! $getProducts !!!!!!!!!!!!');
        List<QueryDocumentSnapshot<Map<String, dynamic>>> shoes =
            getProducts.docs;

        log('message ${shoes.first.id}');
        log('message ${shoes.first.data()['product_name']}');
        log('product_description ${shoes.first.data()['product_description']}');
        log('product_images ${shoes.first.data()['product_images']}');
        final product =
            shoes.map((shoe) => Product.fromFirestore(shoe)).toList();
        // state = state.copyWith(
        //   loadingState: LoadingState.success,
        //   productModel: product,
        // );
        products = product;
      } else {
        log('!!!!!!!!!!!!! OMOH U DON COOK BEANS !!!!!!!!!!!!!');
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
    return products;
  }
}

class HomeScreenState {
  LoadingState loadingState;
  UserModel userModel;
  Product productModel;
  HomeScreenState(
      {this.loadingState = LoadingState.loading,
      required this.userModel,
      required this.productModel});

  HomeScreenState copyWith({
    LoadingState? loadingState,
    Product? productModel,
    UserModel? userModel,
  }) {
    return HomeScreenState(
      loadingState: loadingState ?? this.loadingState,
      userModel: userModel ?? this.userModel,
      productModel: productModel ?? this.productModel,
    );
  }
}
