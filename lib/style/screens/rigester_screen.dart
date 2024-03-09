import 'package:flutter/material.dart';

import '../../screens/login_screen.dart';
import '../colors.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteBlue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/vector.png',
                height: 72,
                width: 72,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Let’s Get Started',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff223263)),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Create an new account',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9098B1)),
              ),
              const SizedBox(
                height: 28,
              ),
              const TextField(
                // controller: ,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: ImageIcon(AssetImage('assets/images/User.png')),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const TextField(
                // controller: ,
                decoration: InputDecoration(
                  hintText: 'Your Email',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon:
                      ImageIcon(AssetImage('assets/images/Message.png')),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const TextField(
                obscureText: true,
                // controller: ,
                decoration: InputDecoration(
                  hintText: 'Pasword',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon:
                      ImageIcon(AssetImage('assets/images/Password.png')),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const TextField(
                obscureText: true,
                // controller: ,
                decoration: InputDecoration(
                  hintText: 'Pasword Again',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon:
                      ImageIcon(AssetImage('assets/images/Password.png')),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(whiteBlue),
                  iconColor: MaterialStatePropertyAll(whiteBlue),
                  overlayColor: MaterialStatePropertyAll(whiteBlue),
                ),
                child: Container(
                    height: 57,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(child: Text('Sign Up'))),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('have a account? '),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }),
                        );
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Color(0xff40BFFF),
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
