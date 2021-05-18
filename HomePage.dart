import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ),
          Center(
        child: Text(uid),)
        ],
      ),
      
    );
  }
  
@override
  void initState() {
    
    super.initState();
    uid = FirebaseAuth.instance.currentUser.uid;
  }
}

