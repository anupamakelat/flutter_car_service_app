// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/reject/function.dart';
import 'package:drive_buddy/database/reject/model.dart';
import 'package:drive_buddy/user/Notification/reject.dart';
import 'package:google_fonts/google_fonts.dart';

class RejectedPage extends StatefulWidget {
  const RejectedPage({super.key});

  @override
  State<RejectedPage> createState() => _RejectedPageState();
}

class _RejectedPageState extends State<RejectedPage> {
  @override
  void initState() {
    super.initState();
    getrsp();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold( body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(12.0),
              child: ValueListenableBuilder(
                  valueListenable: inflist2,
                  builder: (context, List<RejectData> list, Widget? child) {
                    return list.isEmpty?
                    Center(
                      child: Column(
                        children: [
                          Image.network('https://assets-v2.lottiefiles.com/a/0e30b444-117c-11ee-9b0d-0fd3804d46cd/BkQxD7wtnZ.gif'),
                          Text('No  Service Have Been Rejected',
                          style: GoogleFonts.aladin(fontSize:20),)
                        ],
                      ),
                    ): SizedBox(
                      height: 1000,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          SizedBox(height: 10,);
                          return const Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: 0,
                          );
                          
                        },
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          final rejectdata = list[index];
                     return
                           InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RejectDetails(request: rejectdata,)));
                            },
                             child: Padding(
                              padding: EdgeInsets.all(12.0),
                               child: Container(
                                 height: 70,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10, right: 15),
                                    ),
                                    Text(rejectdata.problem.toString())
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