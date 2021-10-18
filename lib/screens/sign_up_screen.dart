import 'package:appandup_book/screens/home_screen.dart';
import 'package:appandup_book/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../widgets/circular_border_button.dart';
import '../utils/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authServices = Provider.of<AuthService>(context, listen: false);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height - 30,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/undraw_Bookshelves_re_lxoy.svg',
                        width: screenSize.width * .75,
                      ),
                    ],
                  ),
                  const Spacer(flex: 1),
                  if (_errorMessage != null)
                    Text(
                      '$_errorMessage',
                      style: TextStyle(color: Theme.of(context).errorColor),
                    ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    controller: _emailController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Email Required';
                      }

                      const emailPattern =
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

                      bool isValid = RegExp(emailPattern).hasMatch(value);

                      if (!isValid) {
                        return 'Invalid email address';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    autocorrect: false,
                    controller: _passwordController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password Required';
                      }
                      return null;
                    },
                  ),
                  const Spacer(flex: 2),
                  CircleBordersButton(
                      text: 'SIGN UP',
                      onTap: () {
                        final isValid = _formKey.currentState!.validate();

                        if (isValid) {
                          authServices
                              .signup(_emailController.text,
                                  _passwordController.text)
                              .then((value) => Navigator.pushReplacementNamed(
                                  context, HomePage.routeName))
                              .catchError((error) {
                            setState(() {
                              _errorMessage = error.message;
                            });
                          });
                        }
                      }),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignInScreen.routeName);
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
