import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myplans/MyHomePage/Sign%20in.dart';
import 'package:myplans/Services/Prefs.dart';
import 'package:myplans/Services/auth.dart';
import 'package:myplans/utilities/Utility.dart';
import 'MyHomePage.dart';



class SignUp extends StatefulWidget {
  static final String id='SignUp';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  final _email=new TextEditingController();
  final _password=new TextEditingController();
  final _name=new TextEditingController();


  _doSign(){
    String email=_email.text.trim().toString();
    String  password=_password.text.trim().toString();
    String  name=_name.text.trim().toString();
    print(email);
    if(email.isEmpty||password.isEmpty||name.isEmpty)return null;
    FireBase.signUP(context, email, password,name).then((firebaseuser) => {
      checks(firebaseuser)
    }
    );
  }

  checks(FirebaseUser firebaseuser)async {
    print(firebaseuser);
    if(firebaseuser!=null){
     await Prefs.loadUser(firebaseuser.uid);
      print(firebaseuser.uid);
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

            ),
            SizedBox(
              height: 10,
            ), TextField(
              controller:_name ,
              decoration: InputDecoration(
                  hintText: 'Name',
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
                  _doSign();

                },
                child: Text(
                  'Sign Up',style: TextStyle(color: Colors.white,fontSize: 17),
                ),
              ),
            ),Padding(
              padding: EdgeInsets.only(left: 120,top: 15),
              child: Row(
                children: [
                  Text("Don't you have an account"),
                  SizedBox(width: 10,),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context,SignIn.id);
                      },
                      child: Text('Sign In'))
                ],
              ),
            )
          ],),
      ),
    );
  }
}
