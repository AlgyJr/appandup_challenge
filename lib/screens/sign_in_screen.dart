import 'package:appandup_book/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'sign_up_screen.dart';
import '../utils/services/auth_service.dart';
import '../widgets/circular_border_button.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/signin';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
    final authService = Provider.of<AuthService>(context, listen: false);
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
                        'assets/images/undraw_book_lover_mkck.svg',
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
                      }),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          // TODO forgot password page
                        },
                        child: Text(
                          'Forgot password?',
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
                  const Spacer(flex: 2),
                  CircleBordersButton(
                      text: 'LOGIN',
                      onTap: () {
                        final isValid = _formKey.currentState!.validate();

                        if (isValid) {
                          authService
                              .login(_emailController.text,
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
                  const SizedBox(height: 20.0),
                  _buildFacebookButton(context, authService),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have any account?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignUpScreen.routeName);
                        },
                        child: Text(
                          'Sign Up',
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

  InkWell _buildFacebookButton(BuildContext context, AuthService authService) {
    const radius = 30.0;

    return InkWell(
      onTap: () {
        if (kIsWeb) {
          authService.loginWithFacebookWeb().catchError((err) {
            setState(() {
              _errorMessage = err.message;
            });
          });
        } else {
          authService.loginWithFacebook().catchError((err) {
            setState(() {
              _errorMessage = err.message;
            });
          });
        }
      },
      highlightColor: Theme.of(context).primaryColor.withOpacity(0.1),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.4),
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        height: 60.0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 2.5,
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.facebook, color: Colors.black),
              SizedBox(width: 10.0),
              Center(
                child: Text(
                  'Log in with Facebook',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
