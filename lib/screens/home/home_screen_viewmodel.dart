import 'package:building_ui/exports/exports.dart';

class HomeScreenViewModel extends StateNotifier<HomeScreenState> {
  HomeScreenViewModel() : super(HomeScreenState());

  // retrieveUsername() async {
  //   Stream<QuerySnapshot> userStream = FirebaseFirestore.instance
  //       .collection('users')
  //       .snapshots()
  //       .map((snapshot) =>
  //           snapshot.docs.map((doc) => UserModel.fromJson(doc.data())));
  // }
}

class HomeScreenState {
  LoadingState loadingState;
  HomeScreenState({this.loadingState = LoadingState.loading});

  HomeScreenState copyWith({
    LoadingState? loadingState,
  }) {
    return HomeScreenState(
      loadingState: loadingState ?? this.loadingState,
    );
  }
}
