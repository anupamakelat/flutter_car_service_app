// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/accept/function.dart';
import 'package:drive_buddy/database/acceptDriver/function.dart';
import 'package:drive_buddy/database/acceptDriver/model.dart';
import 'package:drive_buddy/user/accept.dart';
import 'package:drive_buddy/user/Notification/driver_data_accep.dart';

import '../../database/accept/model.dart';

class AllAccepted extends StatefulWidget {
  const AllAccepted({super.key});
 
  @override
  State<AllAccepted> createState() => _AllAcceptedState();
}

class _AllAcceptedState extends State<AllAccepted> {
  @override
  
  void initState() {
     getasp();
     getaspRequest();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: SingleChildScrollView(
       child: Column(
            children: [Text('Service List'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  
                  height: 300,
                  child: ValueListenableBuilder(
                      valueListenable: inflist1,
                      builder: (context, List<AcceptData> list, Widget? child) {
                        return     list.isEmpty?Center(child: Text('it was empty',style: const TextStyle(color: Colors.black),),): SizedBox(
                          height: 300,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              
                              return const Divider(
                                color: Colors.grey,
                                thickness: 1,
                                height: 0,
                              );
                            },
                            itemCount: list.length,
                            itemBuilder: (BuildContext context, int index) {
                              final acceptdata = list[index];
                         return
                               InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AcceptDetails(requests: acceptdata,)));
                                },
                                 child: Padding(padding: EdgeInsets.all(12.0),
                                   child: Container(
                                     height: 70,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 10, right: 15),
                                        ),
                                        Text(acceptdata.problem.toString())
                                 
                                      ],
                                    ),
                                                             ),
                                 ),
                               );
                            },
                          ),
                        );
                      }),
                ),
              ),
              Text('Driver Request'),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: ValueListenableBuilder(
                      valueListenable:requestacceplist,
                      builder: (context, List<AcceptDriver> list, Widget? child) {
                        return   
                          list.isEmpty?Center(child: Text('',style: const TextStyle(color: Colors.black),),): SizedBox(
                          height:300,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const Divider(
                                color: Colors.grey,
                                thickness: 1,
                                height: 0,
                              );
                            },
                            itemCount: list.length,
                            itemBuilder: (BuildContext context, int index) {
                              final acceptdata = list[index];
                         return
                               InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AcceptDriData(requests: acceptdata,)));
                                },
                                 child: Padding(padding: EdgeInsets.all(12.0),
                                   child: Container(
                                     height: 70,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 10, right: 15),
                                        ),
                                        Text(acceptdata.pickuplocation.toString())
                                       
                                      ],
                                    ),
                                                             ),
                                 ),
                               );
                            },
                          ),
                        );
                      }),
                ),
              )
            ],
            
          ),
     ) 
      
       );
  }
}