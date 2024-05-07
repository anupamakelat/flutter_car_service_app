// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/onRoadBook/functions.dart';
import 'package:drive_buddy/database/onRoadBook/model.dart';
import 'package:drive_buddy/user/on_details.dart';

class MyService extends StatefulWidget {
  const MyService({super.key});

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  @override
  void initState() {
    super.initState();
    getinfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ValueListenableBuilder(
                  valueListenable: inflist,
                  builder: (context, List<OnRoadData> list, Widget? child) {
                    return     list.isEmpty?Center(child: Text('it was empty',style: TextStyle(color: Colors.black),),): SizedBox(
                      height: 1000,
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
                          final onRoaddata = list[index];
                     return
                           InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceDetails(requsts: onRoaddata,)));
                            },
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
                                  Text(onRoaddata.problem.toString())
                                  // Text(list[index].contact??"no contact",style: TextStyle(color: Colors.amber),)
                                ],
                              ),
                                                       ),
                           );
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
