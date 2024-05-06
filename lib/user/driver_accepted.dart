// ignore_for_file: prefer_const_constructors, annotate_overrides

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/acceptDriver/function.dart';
import 'package:drive_buddy/database/acceptDriver/model.dart';
import 'package:drive_buddy/user/Notification/driver_data_accep.dart';

class DriverAccepted extends StatefulWidget {
  const DriverAccepted({super.key});

  @override
  State<DriverAccepted> createState() => _DriverAcceptedState();
}

class _DriverAcceptedState extends State<DriverAccepted> {
  @override
  void initState() {
    super.initState();
    getaspRequest();
  }
  Widget build(BuildContext context) {
    return   Scaffold( body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(12.0),
              child: ValueListenableBuilder(
                  valueListenable:requestacceplist,
                  builder: (context, List<AcceptDriver> list, Widget? child) {
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