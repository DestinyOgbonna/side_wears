import 'package:building_ui/exports/exports.dart';

class ProfileUpdate extends ConsumerStatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends ConsumerState<ProfileUpdate> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myProfileScreenModel);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: const MyAppBar(
          isSettings: true,
          title: 'Update Profile',
          isProfile: false,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 30.0.h,
            ),
            Center(
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Wrap(
                          children: [
                            InkWell(
                              onTap: () {
                                ref
                                    .watch(myProfileScreenModel.notifier)
                                    .uploadProfileImageFromCamera();
                                context.router.pop();
                              },
                              child: const ListTile(
                                leading: Icon(Icons.camera_alt_outlined),
                                title: Text('Camera'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                ref
                                    .watch(myProfileScreenModel.notifier)
                                    .uploadProfileImageFromGallery();
                                context.router.pop();
                              },
                              child: const ListTile(
                                leading: Icon(Icons.browse_gallery),
                                title: Text('Gallery'),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: state.image != null
                      ? Stack(
                          children: [
                            CircleAvatar(
                                backgroundColor: AppColors.lightgreyColor,
                                minRadius: 40.0.r,
                                maxRadius: 45.0.r,
                                backgroundImage: FileImage(
                                  state.image!,
                                )),
                            Positioned(
                                top: 60.0.h,
                                left: 60.0.h,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 20.0.h,
                                  color: Colors.blue,
                                )),
                          ],
                        )
                      : Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.lightgreyColor,
                              minRadius: 40.0.r,
                              maxRadius: 45.0.r,
                              child: Icon(
                                Icons.person,
                                size: 40.0.r,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            Positioned(
                                top: 60.0.h,
                                left: 60.0.h,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 20.0.h,
                                  color: Colors.blue,
                                )),
                          ],
                        )),
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Center(
              child: Text(
                'Change profile picture',
                style: AppStyles.smallgreyText,
              ),
            ),
            SizedBox(
              height: 30.0.h,
            ),
            Text('Enter First Name', style: AppStyles.smallwhiteText),
            SizedBox(
              height: 10.0.h,
            ),
            CustomTextField(
              labelText: 'Enter Name',
              controller: nameController,
              obscureText: false,
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Text(' Phone Number', style: AppStyles.smallwhiteText),
            SizedBox(
              height: 10.0.h,
            ),
            CustomTextField(
              labelText: 'Enter Phone Number',
              controller: phoneController,
              obscureText: false,
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Text('Enter UserName', style: AppStyles.smallwhiteText),
            SizedBox(
              height: 10.0.h,
            ),
            CustomTextField(
              labelText: 'User Name',
              controller: userNameController,
              obscureText: false,
            ),
            SizedBox(
              height: 10.0.h,
            ),
            Text(' Address', style: AppStyles.smallwhiteText),
            SizedBox(
              height: 10.0.h,
            ),
            CustomTextField(
              labelText: 'Enter Addresss',
              controller: addressController,
              obscureText: false,
            ),
            SizedBox(
              height: 30.0.h,
            ),
            Center(
                child: InkWell(
                    onTap: () {
                      ref.read(myProfileScreenModel.notifier).showProgressBar();
                      ref.read(myProfileScreenModel.notifier).updateUserDetails(
                          phoneController,
                          nameController,
                          userNameController,
                          addressController,
                          context);
                    },
                    child: state.isProgress != true
                        ? CustomButton(buttonText: 'Submit', width: 150.0.w)
                        : const CircularProgressIndicator.adaptive()))
          ]),
        ),
      ),
    );
  }
}
