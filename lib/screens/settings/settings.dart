import 'package:building_ui/exports/exports.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final CollectionReference userRef = FirebaseFirestore.instance
        .collection('users'); //!TODO Learn !Dependency INjection

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: const MyAppBar(
          isSettings: false,
          title: 'Settings',
          isProfile: true,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder<DocumentSnapshot?>(
          future: userRef.doc(FirebaseAuth.instance.currentUser!.uid).get(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (snapshot.connectionState == ConnectionState.none) {
              return const Center(child: Text('No data'));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              return Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 15.0.h, vertical: 15.0.h),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const ProfileUpdate()))); //!Route to be generated
                        },
                        child: AccountsBar(
                          titleText: '${data['username']}',
                          subText: '${data['email']}',
                        ),
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
                          ref
                              .read(mySettingsScreenModel.notifier)
                              .signOutUser(context);
                        },
                        child: SettingsBar(
                          titleText: 'Log out',
                          icons: const Icon(Icons.logout),
                          isDarkMode: false,
                        ),
                      ),
                    ]),
              );
            }
            return const Center(child: Text('Loading'));
          },
        ),
      ),
    );
  }
}
