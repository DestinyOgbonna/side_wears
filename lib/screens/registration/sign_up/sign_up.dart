import 'package:building_ui/exports/exports.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;
  @override
  void initState() {
    super.initState();
    ref.read(mySplashScreenModel.notifier).checkInternetConnection();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mySignUpViewmodel);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          bottom: false,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0.h,
                ),
                Center(
                  child: Text(
                    'Sign Up',
                    style: AppStyles.boldgreyText,
                  ),
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                CustomTextField(
                  labelText: 'Enter Email Address',
                  controller: emailController,
                  obscureText: false,
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                CustomTextField(
                  labelText: 'Enter Name',
                  controller: nameController,
                  obscureText: false,
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                CustomTextField(
                  labelText: 'Enter User Name',
                  controller: userNameController,
                  obscureText: false,
                ),
                SizedBox(
                  height: 30.0.h,
                ),
                CustomTextField(
                  labelText: 'Enter Password',
                  controller: passwordController,
                  obscureText: _isHidden,
                  suffixIcon: GestureDetector(
                    onTap: _togglePasswordView,
                    child: Icon(
                      _isHidden ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.whiteColor, // Add this line
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      ref.read(mySignUpViewmodel.notifier).signUpUser(
                          emailController,
                          passwordController,
                          nameController,
                          userNameController,
                          context);
                    },
                    child: const CustomButton(
                        buttonText: 'Submit', width: double.infinity),
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () => context.router.push(const SignInPageRoute()),
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: AppStyles.smallgreyText,
                        children: [
                          TextSpan(
                              text: 'Log in', style: AppStyles.mediumgreyText),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                Center(
                  child: Text('Sign Up with on of the following options.',
                      style: AppStyles.mediumgreyText),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    socialNetwork('google'.png),
                    socialNetwork('apple'.png),
                    socialNetwork('google'.png),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
