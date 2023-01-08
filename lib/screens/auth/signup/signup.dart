import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/constants/spacer_constant.dart';
import 'package:agricrops/enums/role_enum.dart';
import 'package:agricrops/enums/user_status_enum.dart';
import 'package:agricrops/main.dart';
import 'package:agricrops/models/farmers_association/farmers_association.dart';
import 'package:agricrops/models/signup/signup.dart';
import 'package:agricrops/models/user/app_user.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/farmers_association_provider.dart';
import 'package:agricrops/screens/auth/signup/components/user_dropdown.dart';
import 'package:agricrops/screens/shared_components/background_image.dart';
import 'package:agricrops/utilities/snackbar_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signinFormKey = GlobalKey<FormState>();
  String associationUidArg = '';
  IAmDropdown? selectedIAmDropdown;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController associationController = TextEditingController();
  TextEditingController associationUidController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    associationController.dispose();
    associationUidController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final Size size = MediaQuery.of(context).size;

    _getAssociationUid();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _signinFormKey,
          child: Column(
            children: [
              const BackgroundImageComponent(),
              Text.rich(
                TextSpan(
                  text: 'Create',
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: const [
                    TextSpan(
                      text: ' Account',
                      style: TextStyle(
                        color: kGreen,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                padding: const EdgeInsets.only(
                    right: kAppPadding, bottom: kAppPadding, left: kAppPadding),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: firstNameController,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            decoration:
                                const InputDecoration(labelText: 'First Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'First Name can not be empty';
                              }

                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: lastNameController,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            decoration:
                                const InputDecoration(labelText: 'Last Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Last Name can not be empty';
                              }

                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    associationUidArg.isEmpty
                        ? Column(
                            children: [
                              const SizedBox(height: 5),
                              TypeAheadFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: associationController,
                                  decoration: const InputDecoration(
                                      labelText: 'Select your Association'),
                                  textInputAction: TextInputAction.next,
                                ),
                                onSuggestionSelected:
                                    (FarmersAssociation association) {
                                  associationController.text = association.name;
                                  associationUidController.text =
                                      association.uid;
                                },
                                itemBuilder:
                                    (context, FarmersAssociation association) {
                                  return ListTile(
                                      title: Text(association.name));
                                },
                                suggestionsCallback: (association) {
                                  return context
                                      .read<FarmersAssociationProvider>()
                                      .searchFarmerAssociation(association);
                                },
                                transitionBuilder:
                                    (context, suggestionBox, controller) {
                                  return suggestionBox;
                                },
                                validator: (association) {
                                  if (association == null ||
                                      association.isEmpty) {
                                    return 'Farmer\'s Association can not be empty';
                                  }

                                  return null;
                                },
                              ),
                            ],
                          )
                        : Container(),
                    associationUidArg.isEmpty
                        ? Column(
                            children: [
                              const SizedBox(height: 5),
                              DropdownButtonFormField<IAmDropdown>(
                                value: selectedIAmDropdown,
                                decoration: const InputDecoration(
                                    labelText: 'I am a Farmer or Buyer...?'),
                                items: iAmDropdownList
                                    .map(
                                        (item) => DropdownMenuItem<IAmDropdown>(
                                              value: item,
                                              child: Text(item.value),
                                            ))
                                    .toList(),
                                onChanged: (IAmDropdown? iAmDropdown) {
                                  setState(() {
                                    selectedIAmDropdown = iAmDropdown;
                                  });
                                },
                                validator: (IAmDropdown? iAmDropdown) {
                                  if (iAmDropdown == null) {
                                    return 'Please select if you are a Farmer or Buyer';
                                  }

                                  return null;
                                },
                              ),
                            ],
                          )
                        : Container(),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: usernameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username can not be empty';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password can not be empty';
                        }

                        if (!_validPassword(value)) {
                          return 'Invalid Password. Password has weak combination';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration:
                          const InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Re-enter your Password';
                        }

                        if (value.compareTo(passwordController.text) != 0) {
                          return 'Password did not match';
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(45),
                        backgroundColor: kGreen,
                        textStyle: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      child: const Text('Sign Up'),
                      onPressed: () {
                        if (_signinFormKey.currentState!.validate()) {
                          _signup(authProvider);
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getAssociationUid() {
    final arguments = (ModalRoute.of(context)!.settings.arguments ??
        <String, dynamic>{}) as Map;
    associationUidArg = arguments['associationUid'] ?? '';
  }

  bool _validPassword(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(password);
  }

  Future<void> _signup(AuthProvider authProvider) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      final signUp = SignUp.create(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: '${usernameController.text.trim()}@agricropstest.com',
        password: passwordController.text.trim(),
        role: associationUidArg.isEmpty
            ? Role.values[selectedIAmDropdown!.key]
            : Role.admin,
        status: associationUidArg.isEmpty
            ? UserStatus.pending
            : UserStatus.approved,
        associationUid: associationUidArg.isEmpty
            ? associationUidController.text.trim()
            : associationUidArg,
      );

      authProvider.createAccount(signUp).then((_) {
        authProvider.setDisplayName(
            displayName: '${signUp.firstName} ${signUp.lastName}');

        final isUserSysAdmin = authProvider.appUser == null
            ? false
            : _isUserSysAdmin(authProvider.appUser!);

        var message =
            'You have successfully created your account. You will be able to login once your account approved by the Admin from your Association.';
        if (isUserSysAdmin) {
          message = 'You have successfully created an Admin account.';
        }

        _showCreateUserSuccessDialog(message).then((value) =>
            navigatorKey.currentState!.popUntil((route) => route.isFirst));
      }).catchError((error) {
        SnackbarUtility.showDangerSnackBar(error.message);
        Navigator.of(context).pop();
      });
    } on FirebaseException catch (e) {
      SnackbarUtility.showDangerSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }

  Future<void> _showCreateUserSuccessDialog(String message) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Account'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  bool _isUserSysAdmin(AppUser appUser) {
    return (appUser.associationUid.isEmpty && appUser.role == Role.sysadmin);
  }
}
