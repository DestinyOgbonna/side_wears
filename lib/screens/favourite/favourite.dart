import 'package:building_ui/exports/exports.dart';

class FavouritePage extends ConsumerStatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavouritePageState();
}

class _FavouritePageState extends ConsumerState<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0.h),
            child: const Center(child: Text('Favourites')),
          ),
        ],
      ),
    );
  }
}
