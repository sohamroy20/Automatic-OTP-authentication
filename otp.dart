import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class otpScreen extends StatefulWidget {
  final String phone;
  otpScreen(this.phone);
  @override
  _otpScreenState createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  String _verificationCode;
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(43, 46, 66, 1),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: const Color.fromRGBO(126, 203, 224, 1),
      ),
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      decoration: BoxDecoration(color: Colors.red[200]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Container(margin: EdgeInsets.only(top: 100),
          child: Center(child: Text('Verify +91 ${widget.phone}',style:TextStyle(fontWeight: FontWeight.w500,fontSize:28,fontStyle:FontStyle.normal)),
          ),
        ),
        Padding(
      padding: const EdgeInsets.all(30.0),
      child: PinPut(
        fieldsCount: 6,
        withCursor: true,
        textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
        eachFieldWidth: 40.0,
        eachFieldHeight: 55.0,
        //onSubmit: (String pin) => _showSnackBar(pin),
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration,
        followingFieldDecoration: pinPutDecoration,
        pinAnimationType: PinAnimationType.fade,
      ),
    )
        //Container(margin: EdgeInsets.only(top: 60),)
      ],),
    ),);
      
  // ignore: dead_code
  _verifyPhone()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 ${widget.phone}', 
      verificationCompleted:(PhoneAuthCredential credential)async{
        await FirebaseAuth.instance.signInWithCredential(credential).then((value)async{
          if(value.user!=null){
            print("You have logged in");
          }
        });
      },
      verificationFailed:(FirebaseAuthException e){
        print(e.message);
      },
      codeSent:(String verificationID,int resendToken){
        setState(() {
                  _verificationCode=verificationID;// code and id are copied to be checked later
                });
      },
      codeAutoRetrievalTimeout:(String verificationID){
        setState(() {
                  _verificationCode=verificationID;// code and id are retrieved to be checked later
                });
      },timeout:Duration(seconds:65));
  }
  }
}