// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:drive_buddy/admin/onroad_detail_page.dart';
import 'package:drive_buddy/database/onRoadBook/functions.dart';
import 'package:drive_buddy/database/onRoadBook/model.dart';
import 'package:google_fonts/google_fonts.dart';

class UsRequest extends StatefulWidget {
  const UsRequest({super.key});

  @override
  State<UsRequest> createState() => _UsRequestState();
}

class _UsRequestState extends State<UsRequest> {
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
                    return list.isEmpty?
                    Center(
                      child: Column(
                        children: [
                          Image.network('https://assets-v2.lottiefiles.com/a/0e30b444-117c-11ee-9b0d-0fd3804d46cd/BkQxD7wtnZ.gif'),
                          Text('No Service Request Available',
                          style: GoogleFonts.aladin(fontSize:20),)
                        ],
                      ),
                    ):
                    SizedBox(
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
                          return InkWell(
                            onTap: () {
                              
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OnRoadPage(datas: onRoaddata,)));
                            },
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
                                      padding:
                                          EdgeInsets.only(left: 10, right: 15),
                                      child: CircleAvatar(
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                    Text(onRoaddata.contact.toString())
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
