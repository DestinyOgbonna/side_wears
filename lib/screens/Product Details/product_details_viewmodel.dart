import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/model/product_model.dart';

class ProductDetailsViewModel extends StateNotifier<ProductDetailsViewState> {
  ProductDetailsViewModel() : super(ProductDetailsViewState());
  final FirestoreCollectionService _firestoreCollectionService =
      FirestoreCollectionService();
  addtoCart() async {
    try {
      final productsModel = Product(
        producrPrice: '',
        productDescription: '',
        productName: '',
        productImages: [],
      );
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      await docRef.set(
        productsModel.toFirestore(),
      );
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

class ProductDetailsViewState {}
