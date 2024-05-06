// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:drive_buddy/admin/request_details.dart';
import 'package:drive_buddy/database/bookDetails.dart/funtions.dart';
import 'package:drive_buddy/database/bookDetails.dart/model.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}



class _RequestPageState extends State<RequestPage> {

  @override
  void initState() {
    super.initState();
    getRequest();
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
                  valueListenable: requestlist,
                  builder: (context, List<DriverRequest> list, Widget? child) {
                    return list.isEmpty?
                    Center(
                      child: Column(children: [
                        Image.network('https://assets-v2.lottiefiles.com/a/0e30b444-117c-11ee-9b0d-0fd3804d46cd/BkQxD7wtnZ.gif'),
                        Text('No Driver Request Yet',
                        style: GoogleFonts.aladin(fontSize:20),)
                      ],),
                    ):
                     SizedBox(height: 1000,
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
                          final requestdata = list[index];
                          return InkWell(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (details)=>RequestDetails(datas: requestdata))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10, right: 15),
                                      child: CircleAvatar(
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                    Text(requestdata.pickuplocation.toString())
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
