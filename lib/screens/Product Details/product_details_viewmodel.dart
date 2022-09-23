import 'dart:developer';

import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';

class ProductDetailsViewModel extends StateNotifier<ProductDetailsViewState> {
  ProductDetailsViewModel(this._firestoreCollectionService)
      : super(ProductDetailsViewState(productModel: Product()));
  final FirestoreCollectionService _firestoreCollectionService;

  String? prodID;

  productId(String? selectedprodID) {
    prodID = selectedprodID;
  }

//*  GETTING PRODUCT DETAILS FROM SHOES SECTION
  Future<Product?> getProducts() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.shoesRef.doc(prodID).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        DocumentSnapshot<Map<String, dynamic>> getProductDetails = getUser;
        final showProductDetails = Product.fromFirestore(getProductDetails);
        return showProductDetails;
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
    return null;
  }

//*  GETTING PRODUCT DETAILS FROM WristWatch SECTION
  Future<Product?> getWristWatch() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getWatchProducts =
          await _firestoreCollectionService.watchesRef.doc(prodID).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      if (getWatchProducts.exists) {
        DocumentSnapshot<Map<String, dynamic>> getWatchDetail =
            getWatchProducts;
        final showProductDetails = Product.fromFirestore(getWatchDetail);
        return showProductDetails;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

//*  GETTING PRODUCT DETAILS FROM HOODIES SECTION
  Future<Product?> getHoddies() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getHoodieproducts =
          await _firestoreCollectionService.hoodieRef.doc(prodID).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      if (getHoodieproducts.exists) {
        DocumentSnapshot<Map<String, dynamic>> getHoodieDetail =
            getHoodieproducts;

        final showProductDetails = Product.fromFirestore(getHoodieDetail);

        return showProductDetails;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

//!NEEDS TO BE REPEATED
  Future<Product?> addToCart() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.watchesRef.doc(prodID).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        state = state.copyWith(
          loadingState: LoadingState.loading,
        );
        final showProductDetails = Product.fromFirestore(getUser);
        state = state.copyWith(
          loadingState: LoadingState.success,
          productModel: showProductDetails,
        );
        _firestoreCollectionService.usersRef
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Cart')
            .doc('$prodID')
            .set({
          'product_name': showProductDetails.productName,
          'product_price': showProductDetails.productPrice,
          'product_description': showProductDetails.productDescription,
          'product_image': showProductDetails.productImages,
        });
        Fluttertoast.showToast(
            msg: 'Added to Cart',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        return showProductDetails;
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
    return null;
  }

//!NEEDS TO BE REPEATED

  Future toggleFavouriteIcon() async {
    state = state.copyWith(isSelected: !state.isSelected);
    if (state.isSelected != true) {
      try {
        final DocumentSnapshot<Map<String, dynamic>> getUser =
            await _firestoreCollectionService.watchesRef.doc(prodID).get()
                as DocumentSnapshot<Map<String, dynamic>>;
        if (getUser.exists) {
          state = state.copyWith(
            loadingState: LoadingState.loading,
          );
          final showProductDetails = Product.fromFirestore(getUser);
          state = state.copyWith(
            loadingState: LoadingState.success,
            productModel: showProductDetails,
          );
          _firestoreCollectionService.usersRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('Favorites')
              .doc('$prodID')
              .set(
            {
              'product_name': showProductDetails.productName,
              'product_price': showProductDetails.productPrice,
              'product_description': showProductDetails.productDescription,
              'product_image': showProductDetails.productImages,
            },
          );
          Fluttertoast.showToast(
              msg: 'Added to Favourite',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          return showProductDetails;
        }
      } on FirebaseException catch (e) {
        Fluttertoast.showToast(
            msg: '${e.message}',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      _firestoreCollectionService.usersRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Favorites')
          .doc('$prodID')
          .delete();
      Fluttertoast.showToast(
          msg: 'Removed From Favorites',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

class ProductDetailsViewState {
  final String? productId;
  LoadingState loadingState;
  Product productModel;
  bool isSelected;

  ProductDetailsViewState({
    this.isSelected = true,
    this.productId = '',
    this.loadingState = LoadingState.loading,
    required this.productModel,
  });

  ProductDetailsViewState copyWith({
    String? productId,
    Product? productModel,
    LoadingState? loadingState,
    bool? isSelected,
  }) {
    return ProductDetailsViewState(
      productId: productId ?? this.productId,
      isSelected: isSelected ?? this.isSelected,
      productModel: productModel ?? this.productModel,
      loadingState: loadingState ?? this.loadingState,
    );
  }
}
