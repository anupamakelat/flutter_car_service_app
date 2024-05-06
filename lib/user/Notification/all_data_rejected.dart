// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/reject/function.dart';
import 'package:drive_buddy/database/reject/model.dart';
import 'package:drive_buddy/database/rejectDriver/functions.dart';
import 'package:drive_buddy/database/rejectDriver/model.dart';
import 'package:drive_buddy/user/Notification/driver_data_reject.dart';
import 'package:drive_buddy/user/Notification/reject.dart';

class AllRejected extends StatefulWidget {
  const AllRejected({super.key});

  @override
  State<AllRejected> createState() => _AllRejectedState();
}

class _AllRejectedState extends State<AllRejected> {
  @override
  void initState() {
     getrsp();
      getrejRequest();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: ValueListenableBuilder(
                      valueListenable: inflist2,
                      builder: (context, List<RejectData> list, Widget? child) {
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RejectDetails(request: acceptdata,)));
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
                                        // Text(list[index].contact??"no contact",style: TextStyle(color: Colors.amber),)
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
            ),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: ValueListenableBuilder(
                    valueListenable:requestrejectlist,
                    builder: (context, List<RejectDriver> list, Widget? child) {
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>RejectDriData(requests: acceptdata,)));
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
                                      // Text(list[index].contact??"no contact",style: TextStyle(color: Colors.amber),)
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
          
        ) 
      
       );
  }
}