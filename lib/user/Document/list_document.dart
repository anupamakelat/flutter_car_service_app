// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:drive_buddy/database/addDocument/function.dart';
import 'package:drive_buddy/database/addDocument/model.dart';
import 'package:drive_buddy/user/Document/documents.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyDocumentList extends StatefulWidget {
  const MyDocumentList({super.key});

  @override
  State<MyDocumentList> createState() => _MyDocumentListState();
}

class _MyDocumentListState extends State<MyDocumentList> {
  @override
  void initState() {
    super.initState();
    getdr();
  }
   bool isGridView = true;

  void toggleView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  final List<String> items = List.generate(20, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Saved documents'),
          centerTitle: true,
         
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddDocumentPage(
                         isEdit: false,
                        )));
          },
          child: Icon(Icons.add),
        ),
        body: ValueListenableBuilder(
            valueListenable: doclist,
            builder: (context, List<Document> list, Widget? child) {
              return GridView.builder(
  shrinkWrap: true,
  // physics: NeverScrollableScrollPhysics(),
  itemCount: list.length,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 1,
    crossAxisSpacing: 12.0,
    mainAxisSpacing: 12.0,
    mainAxisExtent: 325,
  ),
  itemBuilder: (BuildContext context, int index) {
    final docdata = list.reversed.toList()[index];
    // Convert expiration date string to DateTime object
    DateTime expirationDateTime = DateTime.parse(docdata.expirationDate!);
    // Compare expiration date with current date
    bool isExpired = expirationDateTime.isBefore(DateTime.now());
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            // Handle document tap
            
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              // border: Border.all()
              // color: isExpired ? Colors.red : Color.fromARGB(255, 249, 244, 247),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Color.fromARGB(255, 224, 60, 60),
                      child: Placeholder(
                        child: SizedBox(
                          height: 180,
                          child: SfPdfViewer.file(
                           File(docdata.pdf!)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          docdata.name!.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.w600
                          )                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      isExpired?
                      Text("Expired",style: TextStyle(color: Colors.red[400],fontWeight: FontWeight.w600),)
                      : 
                      Text(
                        docdata.expirationDate!.toUpperCase(),
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600
                        ),
                      )
                      ,
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (reg) => AddDocumentPage(
                                    data: docdata,
                                    isEdit: true,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              delete(context, docdata.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  },
);

           
                
            
            }));
  }

  

  Future<void> deletedoc(context, int? id) async {
    final remove = await Hive.openBox<Document>('addDoc');
    remove.delete(id);
    getdr();

   
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
                      deletedoc(context, id);
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




