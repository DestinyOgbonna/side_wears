import 'package:building_ui/core/exports/exports.dart';

class FirestoreCollectionService {
  final CollectionReference shirtsRef =
      FirebaseFirestore.instance.collection('shirts');
  final CollectionReference shoesRef =
      FirebaseFirestore.instance.collection('shoes');
  final CollectionReference watchesRef =
      FirebaseFirestore.instance.collection('wrist_watches');

  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference hoodieRef =
      FirebaseFirestore.instance.collection('hoodie');
}

final firebaseCollectionService = Provider<FirestoreCollectionService>((ref) {
  return FirestoreCollectionService() ;
});