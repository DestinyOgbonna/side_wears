import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/model/product_model.dart';

class ProductDetailsViewModel extends StateNotifier<ProductDetailsViewState> {
  ProductDetailsViewModel() : super(ProductDetailsViewState());
  final FirestoreCollectionService _firestoreCollectionService =
      FirestoreCollectionService();

  String? productId;

  addtoCart() async {
    try {
      final getProduct = _firestoreCollectionService.productsRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      final productsModel = Product(
        productPrice: 500,
        productName: "product_name",
        productImages: ["product_image"],
      );
      final docRef = _firestoreCollectionService.cartRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Cart')
          .doc('CVRm2aTwusFvTKAa2EXF');
      await docRef
          .set(
            productsModel.toFirestore(),
          )
          .then(
            (value) => Fluttertoast.showToast(
              msg: "Added to cart",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            ),
          )
          .catchError((err) {
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

  Future<Product?> getSingleProductDetails() async {
    try {
      final prodref = _firestoreCollectionService.cartRef
          .doc('CVRm2aTwusFvTKAa2EXF')
          .get()
          .then((DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print('!!!!!!!!!!! $data!!!!!!!!!!!!!!!');
      });
      print('!!!!!!!!!!! $prodref!!!!!!!!!!!!!!!');
    } catch (e) {}
    return null;
  }
}

class ProductDetailsViewState {
  final String? productId;

  ProductDetailsViewState({this.productId = ''});

  ProductDetailsViewState copyWith({String? productId}) {
    return ProductDetailsViewState(productId: productId ?? this.productId);
  }
}
