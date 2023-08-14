import 'package:auth/login.dart';
import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color(0xFF121212),
      body: TheLogOut(),
    );
  }
}

class TheLogOut extends StatelessWidget {
  const TheLogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 400),
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
        )
      ],
    );
  }
}
