// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:drive_buddy/common/signin.dart';
import 'package:drive_buddy/database/signup/model.dart';
import 'package:drive_buddy/user/Account/about.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  SignupDetails? currentUser;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
  
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   
    var userEmail = prefs.getString('currentUser');

    final useBox = await Hive.openBox<SignupDetails>('signup_db');

    print(useBox.values);
    currentUser = useBox.values.firstWhere(
      (user) => user.email == userEmail,
    );
    setState(() {});
   // print('this is the emil:${currentUser!.email},');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 238, 238),
      body: Column(children: [
        // Divider(
        //   height: 1,
        //   color: const Color.fromARGB(255, 71, 68, 68),
        //   thickness: 2,
        // ),
        Container(
          //height: 70,
          color: Colors.white,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 46,
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${currentUser?.name}',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    '${currentUser?.phone}',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              )
            ],
          ),
        ),
        Divider(
          height: 0.9,
          color: const Color.fromARGB(255, 71, 68, 68),
          thickness: 0.9,
        ),
         
        InkWell(onTap: (){
          lunchurl();
        },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(CupertinoIcons.chat_bubble_text,size: 35,color:Color.fromARGB(255, 50, 192, 57) ,),
              ),
              SizedBox(width: 10,),
              Text('Privacy & Policy',style: GoogleFonts.poppins(fontSize:18),),Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
        Divider(
          height: 0.9,
          color: const Color.fromARGB(255, 71, 68, 68),
          thickness: 0.9,
        ),
       
        
         Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(Icons.payments,size: 35,color:Color.fromARGB(255, 50, 192, 57) ,),
            ),
            SizedBox(width: 10,),
            Text('Payments',style: GoogleFonts.poppins(fontSize:18),),Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
        Divider(
          height: 0.9,
          color: const Color.fromARGB(255, 71, 68, 68),
          thickness: 0.9,
        ),
        
         
         Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(CupertinoIcons.profile_circled,size: 35,color:Color.fromARGB(255, 50, 192, 57) ,),
            ),
            SizedBox(width: 10,),
            Text('Profile',style: GoogleFonts.poppins(fontSize:18),),Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],

        ),
        Divider(
          height: 0.9,
          color: const Color.fromARGB(255, 71, 68, 68),
          thickness: 0.9,
        ),
        InkWell(
          onTap: (){
            
          },
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Moreinfo() ));
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(CupertinoIcons.italic,size: 35,color:Color.fromARGB(255, 50, 192, 57) ,),
                ),
                SizedBox(width: 10,),
                Text('About Us',style: GoogleFonts.poppins(fontSize:18),),Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            
            ),
          ),
        ),

        SizedBox(
          height: 40,
        ),
        InkWell(
                      onTap: () {
                        logout(context);
                      },
                      child: Container(
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 235, 228, 228),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 16, 15, 13)),
                          ),
                        ),
                      ),
                    ),
        
      ]),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Settings',
          style: GoogleFonts.rubik(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
      ),
    );
  }
}

void logout(context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text('Logout'),
      content: Text('Do you want to logout'),
      actions: [
        ElevatedButton(onPressed: (){singout(context);}, child: Text('yes')),
        ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('no')),
      ],
    );
  });
}
singout(context)async{
  final sharedpref=await SharedPreferences.getInstance();
  await sharedpref.clear();
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (login)=>SingIn()), (route) => false);
}
  
Future<void> lunchurl()async{
  final url=Uri.parse('https://www.termsfeed.com/live/7580bd1f-1af8-498c-8b79-5ad54503b516');
  if(await launchUrl(url)){
    //dailer opened
  }else{
    SnackBar(content: Text('couldn\'t launch the page '));
  }
}

