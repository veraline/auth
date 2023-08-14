import 'package:auth/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
         home: Scaffold(
           backgroundColor: const Color(0xFF121212),
           appBar: AppBar(
             elevation: 0,
           backgroundColor: const Color(0xFF121212),
             title: const Center(
                 child: Text("Welcome", style: TextStyle(fontSize: 20),)),

           ),
           body: const TheBody(),
         ),
    );
  }
}

class TheBody extends StatelessWidget {
  const TheBody({super.key});

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
                  MaterialPageRoute(builder: (context) => Register()),
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
                    child: Text('Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 20),)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
