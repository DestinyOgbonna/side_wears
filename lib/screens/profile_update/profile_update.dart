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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  ref
                      .read(myProfileScreenModel.notifier)
                      .uploadProfileImageToFirebase();
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.lightgreyColor,
                  minRadius: 40.0.r,
                  maxRadius: 45.0.r,
                  child: ref.read(myProfileScreenModel.notifier).image != null
                      ? Image.network(
                          ref
                              .read(myProfileScreenModel.notifier)
                              .image
                              .toString(),
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          Icons.person,
                          size: 40.0.r,
                          color: AppColors.lightgreyColor,
                        ),
                ),
              ),
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
              hintText: 'Enter Name',
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
              hintText: 'Enter Phone Number',
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
              hintText: 'User Name',
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
              hintText: 'Enter Addresss',
              controller: addressController,
              obscureText: false,
            ),
            SizedBox(
              height: 30.0.h,
            ),
            Center(
                child: InkWell(
                    onTap: () {
                      ref.read(myProfileScreenModel.notifier).updateUserDetails(
                          phoneController,
                          nameController,
                          userNameController,
                          addressController,
                          context);
                    },
                    child: CustomButton(buttonText: 'Submit', width: 150.0.w)))
          ]),
        ),
      ),
    );
  }
}
