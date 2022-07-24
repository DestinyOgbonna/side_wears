import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/model/product_model.dart';

class ProductDetailsViewModel extends StateNotifier<ProductDetailsViewState> {
  ProductDetailsViewModel() : super(ProductDetailsViewState());
  final FirestoreCollectionService _firestoreCollectionService =
      FirestoreCollectionService();
  addtoCart() async {
    try {
      final productsModel = Product(
        productPrice: "product_price",
        productName: '"product_name"',
        productImages: ["product_image"],
      );
      final docRef = _firestoreCollectionService.cartRef
          .doc(FirebaseAuth.instance.currentUser!.uid);
      await docRef.set(
        productsModel.toFirestore(),
      ).then((value) =>  Fluttertoast.showToast(
                msg: "Added to cart",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0)) .catchError((err) {
            Fluttertoast.showToast(
                msg: err.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          //  state = state.copyWith(loadingState: LoadingState.error);
          });
        return addtoCart;
      
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(
          msg: '${e.message}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //  state = state.copyWith(loadingState: LoadingState.error);
    }
  }
}

getSingleProductDetails() {}

class ProductDetailsViewState {}
