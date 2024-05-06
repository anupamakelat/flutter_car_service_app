// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:drive_buddy/admin/bell.dart';
import 'package:drive_buddy/admin/driver.dart';
import 'package:drive_buddy/admin/tab.dart';
import 'package:drive_buddy/common/widgets/admin_appbar.dart';

class ADhome extends StatefulWidget {
  const ADhome({super.key});

  @override
  State<ADhome> createState() => _ADhomeState();
}

class _ADhomeState extends State<ADhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Driver()));
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrhiChJ6BdjEFIH4PcVywr2cWQ9aUmyLOxuQ&usqp=CAU',
                            height: 140,
                           // Adjusted height to match the container
                           // Changed to BoxFit.cover to ensure the image fills the container
                          ),
    //                       CachedNetworkImage(
    //     imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrhiChJ6BdjEFIH4PcVywr2cWQ9aUmyLOxuQ&usqp=CAU",
    //     placeholder: (context, url) => Icon(Icons.person),
    //     errorWidget: (context, url, error) => Icon(Icons.error),
    //  ),
                          Text('Add Driver')
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Drification()));
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.network(height: 140,
                            'https://i.pinimg.com/236x/0d/b6/f8/0db6f8a4d41701934a9fd0f2b7a15e37.jpg'
                           // Adjusted height to match the container
                           // Changed to BoxFit.cover to ensure the image fills the container
                          ),
                          Text('Driver Request')
                        ],
                      ),
                      
                    ),
                  ),
                ),
                
                
              ],
            ), 
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
               Container(
                    clipBehavior: Clip.antiAlias,
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.network(
                            height: 140,
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeZ3Yh4wUxTOOlIIYjq3d-Tq2_ONU8tFpPyQ&usqp=CAU',
                           // Adjusted height to match the container
                           // Changed to BoxFit.cover to ensure the image fills the container
                          ),
                          Text('User')
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                   InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Bellfication()));
                    },
                     child: Container(
                                       clipBehavior: Clip.antiAlias,
                                       width: 190,
                                       height: 190,
                                       decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                                       ),
                                       child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.network(
                            height: 140,
                            'https://i.pinimg.com/236x/59/6a/b0/596ab0f661df5496f1248a6025469345.jpg',
                           // Adjusted height to match the container
                           // Changed to BoxFit.cover to ensure the image fills the container
                          ),
                          Text('OnRoad Request')
                        ],
                      ),
                                       ),
                                     ),
                   ),
                
                

            ],
            
            ),
          )
        ],
      ),
    );
  }
}
