import 'package:appandup_book/screens/sign_up_screen.dart';
import 'package:appandup_book/widgets/circular_border_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/signin';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
              const TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
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
                    // TODO authenticate with firebase
                  }),
              const SizedBox(height: 20.0),
              _buildFacebookButton(context),
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
                      // TODO navigate to Sign Up screen
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
    );
  }

  InkWell _buildFacebookButton(BuildContext context) {
    const radius = 30.0;

    return InkWell(
      onTap: () {
        // TODO authenticate with Facebook
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
