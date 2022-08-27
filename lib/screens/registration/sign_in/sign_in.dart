import 'package:building_ui/exports/exports.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mySignInViewmodel);
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
                    'Sign In',
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
                      // state.loadingState == LoadingState.loading
                      //     ? const CircularProgressIndicator.adaptive()
                      //     :
                      ref.read(mySignInViewmodel.notifier).signUserIntoApp(
                          emailController, passwordController, context);
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
                    onTap: () =>
                        context.router.replaceAll([const SignUpPageRoute()]),
                    child: RichText(
                      text: TextSpan(
                        text: 'Dont have an account? ',
                        style: AppStyles.smallgreyText,
                        children: [
                          TextSpan(
                              text: 'Register',
                              style: AppStyles.mediumgreyText),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0.h,
                ),
                Center(
                  child: Text('Sign In with on of the following options.',
                      style: AppStyles.mediumgreyText),
                ),
                SizedBox(
                  height: 20.0.h,
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
