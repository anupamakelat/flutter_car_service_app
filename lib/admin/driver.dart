// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:drive_buddy/admin/add_driver.dart';
import 'package:drive_buddy/database/addDriver/function.dart';
import 'package:drive_buddy/database/addDriver/model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:drive_buddy/user/Hiredriver/book_driver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  @override
  void initState() {
    super.initState();
    getdrivers();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 1), () {
      setState(() {});
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Driver Details',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddDriver(
                        isEdit: false,
                      )));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: driverlist,
                  builder: (context, List<DriverData> list, Widget? child) {
                    
                    return list.isEmpty?  Center(
                        child: Column(
                          children: [
                            
                            Image.network('https://assets-v2.lottiefiles.com/a/0e30b444-117c-11ee-9b0d-0fd3804d46cd/BkQxD7wtnZ.gif'),
                            Text('No  Service Have Been Rejected',
                            style: GoogleFonts.aladin(fontSize:20),)
                          ],
                        ),
                      ):
                    
                     SizedBox(height: 1000,
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            final driverdata = list[index];
                            return 
                    
                            Column(
                              children: [
                                Slidable(
                                  startActionPane: ActionPane(
                                      motion: StretchMotion(),
                                      children: [
                                        SlidableAction(
                                            icon: Icons.delete,
                                            label: 'Delete',
                                            backgroundColor: const Color.fromARGB(
                                                255, 255, 0, 0),
                                            onPressed: ((context) =>
                                                delete(context, driverdata.id))),
                                        SlidableAction(backgroundColor: Colors.green,icon: Icons.edit,label: 'Edit',
                                            onPressed: (context) =>
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AddDriver(
                                                              isEdit: true,
                                                              data: driverdata,
                                                            ))))
                                      ]),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) => BookDriver(
                                                  drivedata: driverdata,
                                                  isbook: false)));
                                    },
                                    title: Text(driverdata.name!),
                                  
                                       
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.file(
                                        File('${driverdata.image}'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                )
                              ],
                            );
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<void> deletedriver(context, int? id) async {
    final remove = await Hive.openBox<DriverData>('addDetails');
    remove.delete(id);
    getdrivers();

    // Navigator.of(context)
    //     .pop(MaterialPageRoute(builder: (context) => ()));
  }

  void delete(context, int? id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete'),
            content: Text('Do you want to delete'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      deletedriver(context, id);
                      Navigator.pop(context);
                    });
                  },
                  child: Text('yes')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('no')),
            ],
          );
        });
  }
}

Future<void> editdriver(context, int? id, String name, String image,
    int experience, String discription, int contact) async {
  final editBox = await Hive.openBox<DriverData>('addDetails');
  final existingCategory = editBox.values.firstWhere((user) => user.id == id);
  existingCategory.name = name;
  existingCategory.image = image;
  existingCategory.description = discription;
  existingCategory.experience = experience;
  existingCategory.contact = contact;
  await editBox.put(id,existingCategory);
  getdrivers();
  Navigator.pop(context);
}
