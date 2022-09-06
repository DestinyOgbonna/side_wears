import 'dart:developer';

import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/model/product_model.dart';

class HomeScreenViewModel extends StateNotifier<HomeScreenState> {
  HomeScreenViewModel(this._firestoreCollectionService)
      : super(
          HomeScreenState(
            userModel: UserModel(),
            productModel: Product(),
          ),
        );
  final FirestoreCollectionService _firestoreCollectionService;

  //**************************    Getting the user name of the logged in user   ***************

  Future<UserModel?> getUsername() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.usersRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get() as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        DocumentSnapshot<Map<String, dynamic>> getLoggedInUserName = getUser;
        final loggedInUsername = UserModel.fromFirestore(getLoggedInUserName);
        return loggedInUsername;
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
    return null;
  }

//********************     Getting Shoe Products Fromt the DB  ***********************

  Future<List<Product>> getShoeProducts() async {
    List<Product> shoeProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> getProducts =
          await _firestoreCollectionService.productsRef.get()
              as QuerySnapshot<Map<String, dynamic>>;
      if (getProducts.docs.isNotEmpty) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> shoes =
            getProducts.docs;
        final product =
            shoes.map((shoe) => Product.fromFirestore(shoe)).toList();
        shoeProducts = product;
      } else {
        log('!!!!!!!!!!!!! OMOH U DON COOK BEANS !!!!!!!!!!!!!');
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
    return shoeProducts;
  }

  //********************     Getting Hoodies Products Fromt the DB  ***********************
  Future<List<Product>> getHoodiesProducts() async {
    List<Product> hoodieProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> getProducts =
          await _firestoreCollectionService.productsRef.get()
              as QuerySnapshot<Map<String, dynamic>>;
      if (getProducts.docs.isNotEmpty) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> shoes =
            getProducts.docs;
        final product =
            shoes.map((shoe) => Product.fromFirestore(shoe)).toList();
        hoodieProducts = product;
      } else {
        log('!!!!!!!!!!!!! OMOH U DON COOK BEANS !!!!!!!!!!!!!');
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
    return hoodieProducts;
  }

  //********************     Getting Hoodies Products Fromt the DB  ***********************
  Future<List<Product>> getWearsProducts() async {
    List<Product> wearsProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> getProducts =
          await _firestoreCollectionService.productsRef.get()
              as QuerySnapshot<Map<String, dynamic>>;
      if (getProducts.docs.isNotEmpty) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> shoes =
            getProducts.docs;
        final product =
            shoes.map((shoe) => Product.fromFirestore(shoe)).toList();
        wearsProducts = product;
      } else {
        log('!!!!!!!!!!!!! OMOH U DON COOK BEANS !!!!!!!!!!!!!');
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
    return wearsProducts;
  }

  //********************     Getting Watches Products Fromt the DB  ***********************
  Future<List<Product>> getWatchesProducts() async {
    List<Product> watchesProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> getProducts =
          await _firestoreCollectionService.productsRef.get()
              as QuerySnapshot<Map<String, dynamic>>;
      if (getProducts.docs.isNotEmpty) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> shoes =
            getProducts.docs;
        final product =
            shoes.map((shoe) => Product.fromFirestore(shoe)).toList();
        watchesProducts = product;
      } else {
        log('!!!!!!!!!!!!! OMOH U DON COOK BEANS !!!!!!!!!!!!!');
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
    return watchesProducts;
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
