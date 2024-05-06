// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:drive_buddy/database/addDriver/function.dart';
import 'package:drive_buddy/database/addDriver/model.dart';
import 'package:drive_buddy/user/Hiredriver/book_driver.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverView extends StatefulWidget {
  const DriverView({super.key});

  @override
  State<DriverView> createState() => _DriverViewState();
}

class _DriverViewState extends State<DriverView> {
  @override
  void initState() {
    super.initState();
    getdrivers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Driver Available',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ValueListenableBuilder(
                  valueListenable: driverlist,
                  builder: (context, List<DriverData> list, Widget? child) {
                    return list.isEmpty
                        ? Center(
                            child: Column(children: [
                            Image.network(
                                'https://assets-v2.lottiefiles.com/a/0e30b444-117c-11ee-9b0d-0fd3804d46cd/BkQxD7wtnZ.gif'),
                            Text(
                              'No Driver Available At the Right Movement',
                              style: GoogleFonts.aladin(fontSize: 20),
                            )
                          ]))
                        : SizedBox(height: 10000,
                            child: ListView.separated(
                                itemBuilder: (BuildContext context, int index) {
                                  final driverdata = list[index];
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BookDriver(
                                                          drivedata: driverdata,
                                                          isbook: true,
                                                        )));
                                          },
                                          title: Text(driverdata.name!),
                                          leading: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: FileImage(
                                              File(
                                                '${driverdata.image}',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    height: 0,
                                  );
                                },
                                itemCount: list.length),
                          );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
