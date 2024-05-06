// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:drive_buddy/user/Account/account.dart';

AppBar appbar(BuildContext context) {
  return AppBar(
    
      elevation: 15,
      backgroundColor: const Color(0xff083EF6),
      actions: [IconButton(onPressed:(){logout(context);}, icon: Icon(Icons.logout_outlined))],

      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200),bottomRight: Radius.circular(200)),
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: const [Color(0xff083EF6),Color(0xff008DFF),Colors.deepPurpleAccent,Colors.lightBlueAccent
         ] ),
        ),
      ),
     ),
     shape: RoundedRectangleBorder(
      borderRadius:BorderRadius.only(
        bottomLeft: Radius.circular(200),
        bottomRight: Radius.circular(200)) 
     ),
     bottom: PreferredSize(preferredSize: Size.fromHeight(200),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:CrossAxisAlignment.start,
     children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [Text('Welcome Admin!',
     style: TextStyle(color: Colors.white,fontSize: 30,fontWeight:FontWeight.bold),),
     CircleAvatar(radius: 25,
     backgroundColor:Colors.white,)
     ],
     ),
     Padding(
       padding: const EdgeInsets.only(left: 48.0),
       child: Text('Dashboard',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
       
     ),
     SizedBox(height: 100,)
     ],
     ),
     ),
     );
}