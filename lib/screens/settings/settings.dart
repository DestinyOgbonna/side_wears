import 'package:building_ui/exports/exports.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  void initState() {
    ref.read(mySettingsScreenModel.notifier).getUsername();
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: const MyAppBar(
          isSettings: false,
          title: 'Settings',
          isProfile: true,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18.0.h),
                child: Text(
                  'Account',
                  style: AppStyles.paymentText,
                ),
              ),
              SizedBox(
                height: 30.0.h,
              ),
              InkWell(
                onTap: () {
                  context.router.push(const ProfileUpdateRoute());
                },
                child: FutureBuilder<UserModel?>(
                    future:
                        ref.watch(mySettingsScreenModel.notifier).getUsername(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator.adaptive();
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text('Welcome User'),
                          );
                        }
                      }
                      return AccountsBar(
                        titleText: '${snapshot.data?.username}',
                        subText: '${snapshot.data?.email}',
                      );
                    }),
              ),
              SizedBox(
                height: 30.0.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 18.0.h),
                child: Text(
                  'Settings',
                  style: AppStyles.paymentText,
                ),
              ),
              SizedBox(
                height: 30.0.h,
              ),
              SettingsBar(
                titleText: 'Notifications',
                icons: const Icon(Icons.notifications),
                isDarkMode: true,
              ),
              SizedBox(
                height: 20.0.h,
              ),
              SettingsBar(
                titleText: 'Dark Mode',
                icons: const Icon(Icons.sunny),
                isDarkMode: true,
              ),
              SizedBox(
                height: 20.0.h,
              ),
              SettingsBar(
                titleText: 'Help',
                icons: const Icon(Icons.help),
                isDarkMode: false,
              ),
              SizedBox(
                height: 20.0.h,
              ),
              InkWell(
                onTap: () {
                  ref.read(mySettingsScreenModel.notifier).signOutUser(context);
                },
                child: SettingsBar(
                  titleText: 'Log out',
                  icons: const Icon(Icons.logout),
                  isDarkMode: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
