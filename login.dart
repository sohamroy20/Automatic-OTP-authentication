

import 'package:flutter/material.dart';

import 'otp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      decoration: BoxDecoration(color:Colors.red[200]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children:[
           Container(
             margin: EdgeInsets.only(top: 45),
             child: Center(child: Text('Phone Authentication',style:TextStyle(fontWeight: FontWeight.w400,fontSize:30,fontStyle: FontStyle.italic)),

              ),
           ),
           Container(width: 310,margin:EdgeInsets.only(bottom: 60),child: TextField(decoration: InputDecoration(hintText: 'phone number',prefix:Padding(
             padding: EdgeInsets.all(4),

             child:Text('+91'),)),maxLength: 10,keyboardType:TextInputType.number,controller: _controller,
             ),),
             Container(
               child: SizedBox(
                 height: 53,
                 width: 107,
                 child: RaisedButton(
                          child: Text("Next",style: TextStyle(fontSize: 20),),
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>otpScreen(_controller.text))
                            );
                          },
                          color: Colors.lightBlue,
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                          splashColor: Colors.grey,
             ),
               )
      ),]
    ),

      
    ),);
  }
}