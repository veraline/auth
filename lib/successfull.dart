import 'package:auth/login.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 400),
                    child: Text('Welcome :)', style: TextStyle(color: Colors.black, fontSize: 30),),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(
                        child: Text('Log Out',
                          style: TextStyle(color: Colors.white, fontSize: 20),)),
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
