import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'ListP.dart';
class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;
  
  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();

    });
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Text('An email ha been sent to ${user.emailVerified} pleasee verify'),
      ),
    );
  }
  Future<void> checkEmailVerified() async{
    user = auth.currentUser;
    await user.reload();
    if(user.emailVerified){
      timer.cancel();
      Navigator.push(context, MaterialPageRoute(builder: (context) => ListP()),);
    }
  }
}
