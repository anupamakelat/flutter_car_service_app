// ignore_for_file: prefer_const_constructors, annotate_overrides

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/accept/function.dart';
import 'package:drive_buddy/database/accept/model.dart';
import 'package:drive_buddy/user/accept.dart';

class AcceptPage extends StatefulWidget {
  const AcceptPage({super.key});

  @override
  State<AcceptPage> createState() => _AcceptPageState();
}

class _AcceptPageState extends State<AcceptPage> {
  @override
   void initState() {

    super.initState();
    getasp();
  }
  Widget build(BuildContext context) {
    return  Scaffold( body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(12.0),
              child: ValueListenableBuilder(
                  valueListenable: inflist1,
                  builder: (context, List<AcceptData> list, Widget? child) {
                    return     list.isEmpty?Center(child: Text('it was empty',style: const TextStyle(color: Colors.black),),): SizedBox(
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
            )
          ],
        ),
      ),
    );
  }
}