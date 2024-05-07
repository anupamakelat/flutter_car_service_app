// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:drive_buddy/common/widgets/carousel.dart';
import 'package:drive_buddy/user/Hiredriver/driverdetails.dart';
import 'package:drive_buddy/user/Document/list_document.dart';
import 'package:drive_buddy/user/road_details.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 217, 217),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              color: Color.fromARGB(255, 197, 237, 231),
              child: Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Drive Buddy',
                      style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 3, 207, 109)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Find your custodian!',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 120, 112, 112)),
                    )
                  ],
                ),
              ),
            ),
            CarouselHome(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Services',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (driver) => DriverView()));
                },
                child: Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Image.network(
                          'https://i.pinimg.com/564x/eb/7d/44/eb7d44fd7c2cbf7b335961e2278d7829.jpg',
                           width: 80, // Adjust the width of the image
                           height: 80, 
                           fit: BoxFit.cover,),
                      Text('Hire Driver'),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_circle_right_sharp,
                          size: 40,
                          color: Colors.blue[900],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Road()));
                },
                child: Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Image.network(
                          'https://i.pinimg.com/564x/73/21/0e/73210e9f2718f358a5c6b3855365149c.jpg',
                          width: 80, // Adjust the width of the image
                           height: 80, 
                           fit: BoxFit.cover,),
                      Text('On Road Service'),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_circle_right_sharp,
                          size: 40,
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyDocumentList()));
                },
                child: Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Image.network(
                          'https://i.pinimg.com/564x/15/97/da/1597da4fc45ebd5dd8d170002a7919a1.jpg',
                          width: 80, // Adjust the width of the image
                           height: 80, 
                           fit: BoxFit.cover,),
                      Text('Documents'),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_circle_right_sharp,
                          size: 40,
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
