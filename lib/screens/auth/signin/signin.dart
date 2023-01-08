import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/constants/spacer_constant.dart';
import 'package:agricrops/main.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/screens/shared_components/background_image.dart';
import 'package:agricrops/utilities/snackbar_utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _signinFormKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackgroundImageComponent(),
            const Text.rich(
              TextSpan(
                text: 'Agri',
                style: TextStyle(
                  fontSize: 48,
                ),
                children: [
                  TextSpan(
                    text: 'Crops',
                    style: TextStyle(
                      color: kGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kAppPadding,
                vertical: kAppPadding * 1.5,
              ),
              child: Form(
                key: _signinFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    TextFormField(
                      controller: usernameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: 'Username'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Input your Username';
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Input your password';
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kAppPadding),
              child: SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: kGreen,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: kWhite,
                        ),
                        onPressed: () {
                          if (_signinFormKey.currentState!.validate()) {
                            _signIn(authProvider);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    InkWell(
                      child: const Text('Forgot Password?'),
                      onTap: () {},
                    ),
                    const SizedBox(height: 3),
                    InkWell(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signIn(AuthProvider authProvider) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await authProvider
          .signIn(
        email: '${usernameController.text.trim()}@agricropstest.com',
        password: passwordController.text.trim(),
      )
          .then((_) {
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
      }).catchError((error) {
        SnackbarUtility.showDangerSnackBar(error.message);
        Navigator.of(context).pop();
      }).onError((error, stackTrace) {
        debugPrint('$error');
      });
    } on FirebaseException catch (e) {
      SnackbarUtility.showDangerSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
