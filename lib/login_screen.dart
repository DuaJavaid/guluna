import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'homepage.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool isSignUp = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Navigate to Homepage after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors here, show appropriate message
      if (e.code == 'user-not-found') {
        _showError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _showError('Incorrect password.');
      } else {
        _showError('Invalid login. Please try again.');
      }
    }
  }

  Future<void> _signUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      _showError('Passwords do not match.');
      return;
    }
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Show successful signup
      _showSuccess('Your account has been created successfully!');
    } on FirebaseAuthException catch (e) {
      // Handle errors here
      if (e.code == 'weak-password') {
        _showError('The password is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _showError('The email is already in use.');
      } else {
        _showError('Error creating account. Please try again.');
      }
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSuccess(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Design
          Container(
            height: 270,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.white],
              ),
            ),
          ),

          //logo
          Positioned(
            top: -70,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/logo3.png',
                height: 300,
                width: 300,
              ),
            ),
          ),

          // Login / Signup Form
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 120, bottom: 20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: 320,
                      height: 460,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.6),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Toggle 
                          Container(
                            height: 40,
                            width: 230,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 1.5),
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.9),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        setState(() => isSignUp = false),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isSignUp
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.black,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: isSignUp
                                              ? Colors.black
                                              : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        setState(() => isSignUp = true),
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isSignUp
                                            ? Colors.black
                                            : Colors.white.withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: isSignUp
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Email / Username Field
                          TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: "Enter email or username",
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Password Field
                          TextField(
                            controller: _passwordController,
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: const UnderlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                          ),

                          // Confirm Password Field (Only for Sign Up)
                          AnimatedOpacity(
                            opacity: isSignUp ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: Visibility(
                              visible: isSignUp,
                              child: Column(
                                children: [
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: _confirmPasswordController,
                                    obscureText: !isConfirmPasswordVisible,
                                    decoration: InputDecoration(
                                      hintText: "Confirm Password",
                                      border: const UnderlineInputBorder(),
                                      suffixIcon: IconButton(
                                        icon: Icon(isConfirmPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            isConfirmPasswordVisible =
                                                !isConfirmPasswordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Login / SignUp Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.9),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 80),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            onPressed: () {
                              if (isSignUp) {
                                _signUp();
                              } else {
                                _login();
                              }
                            },
                            child: Text(
                              isSignUp ? 'Sign Up' : 'Login',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // OR Label
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "OR",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),

                          // Social Media Icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.pink,
                                  size: 30,
                                ),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.blueAccent,
                                  size: 30,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
