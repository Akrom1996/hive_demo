import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_example/pages/registerPage.dart';

import 'customInput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? textEditingController1;
  TextEditingController? textEditingController2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController1!.dispose();
    textEditingController2!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff152238),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 120,
              ),
              Container(
                width: 80,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage("assets/images/img1.jpg"),
                        fit: BoxFit.cover)),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 14),
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1),
                ),
              ),
              Text(
                "Sign in to continue",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.1),
              ),
              SizedBox(
                height: 40,
              ),
              InputField(
                controller: textEditingController1,
                prefixIcon: Icon(
                  Icons.person_outlined,
                  color: Colors.white,
                ),
                hintText: "User Name",
              ),
              InputField(
                controller: textEditingController2,
                prefixIcon: Icon(
                  Icons.brush_outlined,
                  color: Colors.white,
                ),
                hintText: "Password",
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 60),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.1),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("pressed");
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.transparent,
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          colors: [
                            Colors.black26,
                            Colors.black12,
                            Colors.black12,
                            Colors.white54
                          ]),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 44,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                          letterSpacing: 1.1),
                    ),
                    TextButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, RegistrationPage.id);
                          Navigator.push(context, CupertinoPageRoute(builder: (_)=>RegistrationPage()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(fontSize: 16, letterSpacing: 1.1),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
