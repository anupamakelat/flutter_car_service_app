// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:drive_buddy/common/signin.dart';
import 'package:drive_buddy/common/welcome.dart';
import 'package:drive_buddy/common/widgets/bottomnav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash>
with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    checkUserLoggin();
   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);


    // Future.delayed(Duration(seconds: 3),(){
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const HomeScreen(),));
    // });
  }
  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //   overlays: SystemUiOverlay.values);  
  //   super.dispose();
  // }
  



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Color.fromARGB(255, 197, 237, 231),
      body: Center(
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Drive Buddy",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700),),
            Image.asset('images/splash.jpeg'),
          ],
         
         ),
        
      ),
      
      
    );
  }
  Future<void>checkUserLoggin()async{
    final sharedprefs=await SharedPreferences.getInstance();
    final userLoggedin =sharedprefs.getBool(SAVE_KEY_NAME);
     
     if(userLoggedin==null || userLoggedin==false){
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const HomeScreen(),));
       Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (welcomeScreen)=>const HomeScreen(),));
    });
     }else{
   Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (welcomeScreen)=>const MyNav(),));
    });
     }

  }

}