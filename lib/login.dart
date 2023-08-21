import 'package:auth/successfull.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _obscureText = true; // To toggle password visibility
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String  _errorMessage = '';


  void _handleLogin() async {
    String email = _emailController.text; // Replace with your email controller
    String password = _passwordController.text; // Replace with your password controller

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Login successful, navigate to the appropriate screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Welcome()), // Replace with your desired screen
      );
    } catch (e) {
      // Handle login errors
      print('Error during login: $e');
      setState(() {
        _errorMessage = 'Wrong email or password'; // Update the error message
      });

      // You can also show an error message to the user using a snackbar or similar
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const  Color(0xFF121212),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context) ;
          },
            child: const Icon(Icons.arrow_back_ios, color: Colors.white,)
        ),

      ),
      body:  SingleChildScrollView(
          child: Column(

            children: [
              const SizedBox(height: 20,),
              const Center(
                  child: Text("Let's Get Started",style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),)
              ),
              const  Center(
                  child: Text('Enter your details to login', style: TextStyle(fontSize: 20, color: Colors.white),)
              ),

              const   Center(
                  child: Text('with Stream Master ', style: TextStyle(fontSize: 20, color: Colors.white),)
              ),



              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  style: const  TextStyle(color: Colors.white),
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: 'email',
                      hintStyle: const TextStyle(color: Colors.white),
                      fillColor: const Color(0xFF222222),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),

                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.grey)
                      )
                  ),
                ),
              ),



              Padding(
                padding:  const EdgeInsets.only(top: 10, left: 20, right: 20),

                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  // Toggle password visibility
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.white),
                      fillColor: const  Color(0xFF222222),
                      filled: true,
                      suffixIcon:  GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                        ),
                      ),


                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.grey)
                      )
                  ),
                ),
              ),

              if (_errorMessage.isNotEmpty) // Add this condition
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),



              const   Padding(
                padding:  EdgeInsets.only( top: 10, left: 260),
                child:  Text('forgot password?', style: TextStyle(color: Colors.deepPurpleAccent),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20,),
                child: GestureDetector(
                  onTap: _handleLogin,
                  child: Container(
                    width: 365,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(
                        child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20),)
                    ),
                  ),
                ),
              ),




              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const  Padding(
                    padding: EdgeInsets.only(top: 10, right: 5),
                    child: Text("Don't have an account?", style: TextStyle(color: Colors.white, fontSize: 15),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 25),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Login()),
                          );
                        },
                        child: const  Text('Register', style: TextStyle(color: Colors.red, fontSize: 15),)
                    ),
                  )
                ],
              )


            ],

          )
      ),
    );

  }
}
