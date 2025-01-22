import 'package:blog_app_frontend/demo.dart';
import 'package:blog_app_frontend/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _header(context),
          ],
        ),
      ),
    );
  }
}

Widget _header(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 450,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, left: 10.0),
          child: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Welcome To Write-Sphere!',
                    speed: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontFamily: 'ComicaBoom',
                      color: Color(0xFFE2D3F5),
                      fontWeight: FontWeight.w900,
                    )),
              ],
              stopPauseOnTap: true,
              totalRepeatCount: 1,
              displayFullTextOnTap: true,
              pause: const Duration(milliseconds: 3000),
            ),
          ),
        ),
      ),
      SvgPicture.asset(
        'assets/images/chat.svg',
        semanticsLabel: 'My SVG Image',
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
      ),
      const SizedBox(height: 20),
      SizedBox(
        width: 300.0,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontFamily: 'ComicaBoom',
            color: Color(0xFFE2D3F5),
            fontWeight: FontWeight.bold,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Register Now!',
                      textStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.065,
                      ),
                      speed: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    ),
                  ],
                  stopPauseOnTap: true,
                  repeatForever: true,
                  displayFullTextOnTap: true,
                  pause: const Duration(milliseconds: 3000),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your journey starts here!',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    color: const Color(0xFFE2D3F5),
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Montserrat'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 40),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE2D3F5).withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
                BoxShadow(
                  color: const Color(0xFFE2D3F5).withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(0, -1),
                ),
                BoxShadow(
                  color: const Color(0xFFE2D3F5).withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(-1, 0),
                ),
                BoxShadow(
                  color: const Color(0xFFE2D3F5).withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(1, 0),
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                () {};
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.login, color: Color(0xFFE2D3F5)),
                  const SizedBox(width: 10),
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFFE2D3F5),
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE2D3F5).withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
                BoxShadow(
                  color: const Color(0xFFE2D3F5).withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(0, -1),
                ),
                BoxShadow(
                  color: const Color(0xFFE2D3F5).withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(-1, 0),
                ),
                BoxShadow(
                  color: const Color(0xFFE2D3F5).withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(1, 0),
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person_add, color: Color(0xFFE2D3F5)),
                  const SizedBox(width: 10),
                  const Text(
                    'Signup',
                    style: TextStyle(
                      color: Color(0xFFE2D3F5),
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
