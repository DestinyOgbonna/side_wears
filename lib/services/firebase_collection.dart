import 'package:building_ui/exports/exports.dart';

class FirestoreCollectionService {
  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');

  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');
}
