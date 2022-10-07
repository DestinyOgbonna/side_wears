import 'package:building_ui/core/exports/exports.dart';

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

  @override
  void initState() {
    super.initState();
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
                  obscureText: state.isSelected,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      ref.read(mySignUpViewmodel.notifier).obscurePassword();
                    },
                    child: Icon(
                      state.isSelected
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.lightgreyColor, // Add this line
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      ref.read(mySignUpViewmodel.notifier).showProgressBar();
                      ref.read(mySignUpViewmodel.notifier).signUpUser(
                          emailController: emailController.text,
                          passwordController: passwordController.text,
                          nameController: nameController.text,
                          userNameController: userNameController.text,
                          context: context);
                    },
                    child: state.isProgress != true
                        ? const CustomButton(
                            buttonText: 'Submit', width: double.infinity)
                        : const CircularProgressIndicator.adaptive(),
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
                  child: Text('Sign Up with one of the following options.',
                      style: AppStyles.smallgreyText),
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
}
