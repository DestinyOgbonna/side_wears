import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/providers/theme.dart';

import 'package:building_ui/themes/themes.dart';

import 'services/mysharedpref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MysharedPref().getInstance();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  late AppThemeProvider _displayModeProvider;
  final appRouter = AppRouter();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _displayModeProvider = AppThemeProvider();
    _displayModeProvider.brightnessMode =
        WidgetsBinding.instance.window.platformBrightness;
  }

  @override
  void didChangePlatformBrightness() {
    if (mounted) {
      _displayModeProvider.brightnessMode =
          WidgetsBinding.instance.window.platformBrightness;
    }
    super.didChangePlatformBrightness();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return
            // refreshListenable.no(
            //   value: _displayModeProvider,
            //   child: Builder(
            //     builder: (context) {
            //       final Provider = ChangeNotifierProvider<AppThemeProvider>((ref) {
            //         return AppThemeProvider();
            //       });
            //       return
            MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(),
          themeMode: ThemeMode.light,
        );
      },

      ///),
    );
  }
  //);
}
//}
