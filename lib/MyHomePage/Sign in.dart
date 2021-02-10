import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myplans/MyHomePage/MyHomePage.dart';
import 'package:myplans/MyHomePage/SignUp.dart';
import 'package:myplans/Services/Prefs.dart';
import 'package:myplans/Services/auth.dart';
import 'package:myplans/utilities/Utility.dart';




class SignIn extends StatefulWidget {
  static final String id='SignIn';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _email=new TextEditingController();
  final _password=new TextEditingController();

  _doSigning(){
    String email=_email.text.trim().toString();
    String  password=_password.text.trim().toString();
    FireBase.signIn(context, email, password).then((firebaseuser) =>{
      check(firebaseuser)
    });


  }
  check(FirebaseUser firebaseuser) {
    if(firebaseuser!=null){
      Prefs.loadUser(firebaseuser.uid);
      Navigator.pushReplacementNamed(context, MyHomePage.id);
    }else{
      Toas.fireToast('check your mistake');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
            children: [
          TextField(
            controller:_email ,
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16
              )
            ),

          ),SizedBox(
                height: 10,
              ), TextField(
                controller:_password ,
                obscureText: true,
                decoration: InputDecoration(

                    hintText: 'Password',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                    )
                ),

              ),SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: FlatButton(
                  onPressed: (){
                    _doSigning();
                  },
                  child: Text(
                    'Sign In',style: TextStyle(color: Colors.white,fontSize: 17),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 120,top: 15),
                child: Row(
             children: [
                 Text("Don't you have an account"),
                 SizedBox(width: 10,),
                 GestureDetector(
                     onTap: (){
                       Navigator.pushNamed(context, SignUp.id);
                     },
                     child: Text('Sign UP'))
             ],
                ),
              )
        ],),
      ),
    );
  }


}
