import 'package:building_ui/core/exports/exports.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    ref.read(myprofileScreenModel.notifier).getUsername();
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: Container(
            margin: EdgeInsets.only(top: 50.0.h),
            child: FutureBuilder<UserModel?>(
                future: ref
                    .watch(myprofileScreenModel.notifier)
                    .getUsername(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const CircularProgressIndicator.adaptive();
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text('Welcome User'),
                      );
                    }
                  }
                  return Center(
                    child: Column(
                      children: [

                        InkWell(
                          onTap: (){
                             context.router.push(const ProfileUpdateRoute());
                          },
                          child: Stack(children: [snapshot.data!.profileImage == null
                              ? CircleAvatar(
                                  radius: 80.0.r,
                                  backgroundImage: const AssetImage(
                                      'assets/images/person.png'),
                                )
                              : CircleAvatar(
                                  radius: 80.0.r,
                                  backgroundImage: NetworkImage(
                                      '${snapshot.data!.profileImage}'),
                                ),
                           Positioned(
                            top: 110.0.h,
                            left: 110.0.h,
                             child: CircleAvatar(
                                    backgroundColor: AppColors.lightgreyColor,
                                    radius: 13.0.r,
                                    child: const Icon(Icons.edit, color: AppColors.whiteColor,)),
                           )
                                
                                ],),
                        ),
                        
                        SizedBox(
                          height: 10.0.h,
                        ),
                        Text(
                          '${snapshot.data?.username}',
                          style: AppStyles.boldgreyText,
                        ),
                        Text(
                          '${snapshot.data?.email}',
                          style: AppStyles.smallgreyText,
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
                  .read(myprofileScreenModel.notifier)
                  .signOutUser(context);
            },
            child: SettingsBar(
              titleText: 'Log out',
              icons: const Icon(Icons.logout),
              isDarkMode: false,
            ),
            ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
