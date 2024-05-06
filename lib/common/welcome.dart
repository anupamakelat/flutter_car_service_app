// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:drive_buddy/common/signin.dart';
import 'package:drive_buddy/common/signup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 197, 237, 231),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 29.0, right: 29.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: const Row(
                    children: [
                      Text(
                        'Drive Buddy',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image(
                          image: AssetImage('images/splash.jpeg'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  children: [
                    Text(
                      'Hire drivers',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 197, 237, 231),
                      height: (MediaQuery.of(context).size.height) / 6,
                      width: MediaQuery.of(context).size.width - 58,
                      child: const Text(
                        'Drive Buddy is your ultimate companion for safe and efficient driving. '
                        'Whether you\'re embarking on a long road trip or just commuting to work, '
                        'Drive Buddy is designed to enhance your driving experience and keep you safe on the road.',
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Image.asset('images/welcome.jpeg'),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SingIn()));
                          },
                          child: Container(
                          width: 150,
                          height:35,
                            decoration: BoxDecoration(color: Colors.black,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(9),),
                            child: Align(alignment:Alignment.center ,
                              child: Text(
                                'sign in',
                                style: TextStyle(fontSize: 18,color: const Color.fromARGB(255, 227, 225, 219)),
                              ),
                            ),
                          ),
                        ),
                       
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SingUp()));
                          },
                          child: Container(
                             height: 35,
                            width: 150,
                            decoration: BoxDecoration(color: Colors.black,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(9),
                            ),
                            child: Align(alignment: Alignment.center,
                              child: Text('sign up',
                              style: TextStyle(fontSize: 18,color: Color.fromARGB(255, 227, 225, 219)),),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
