import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/screens/favourite/favourite.dart';
import 'package:building_ui/screens/search/search_view.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final List<Widget> _items = [
    const HomeScreen(),
    const FavoritePage(),
    const SearchView(),
    const SettingsPage(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IndexedStack(
              index: _selectedIndex,
              children: _items) //_items.elementAt(_index),
          ),
      bottomNavigationBar: _showBottomNav(),
    );
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.darkColor,
      unselectedItemColor: AppColors.lightgreyColor,
      onTap: _onTap,
      showUnselectedLabels: false,
      elevation: 0.0,
      backgroundColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
