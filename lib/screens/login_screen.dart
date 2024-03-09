import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/cubits/auth_cubit/cubit/auth_cubit_cubit.dart';
import 'package:task/test.dart';

import '../style/colors.dart';
import 'rigester_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
   TextEditingController email = TextEditingController();
   TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubitCubit, AuthCubitState>(
      listener: (context, state) {
        if(state is LogedinSuccessful){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("loged in")));
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: (Colors.white),
        appBar: AppBar(
          backgroundColor: whiteBlue,
          // shadowColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 68,
                  ),
                  Image.asset(
                    'assets/images/vector.png',
                    height: 72,
                    width: 72,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Welcome to Lafyuu',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff223263),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Sign in to continue',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff223263)),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                   TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                   TextFormField(
                    controller: pass,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_clock_outlined,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility_off,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(whiteBlue)),
                    onPressed: () {
                     
                      context.read<AuthCubitCubit>().loginCubitFun(email.text, pass.text);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: const Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Or',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color(0xff9098B1)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/Google.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Login with Google',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xff9098B1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/Facebook.png',
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Login with Facebook',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xff9098B1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Color(0xff40BFFF),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have a account?',
                        style:
                            TextStyle(color: Color(0xff9098B1), fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Color(0xff40BFFF),
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
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
