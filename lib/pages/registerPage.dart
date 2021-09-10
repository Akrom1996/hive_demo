import 'package:flutter/material.dart';
import 'package:hive_example/model/User.dart';
import 'package:hive_example/service/hive.dart';

import 'customInput.dart';

class RegistrationPage extends StatefulWidget {
  static String id = "Register_id";
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController? textEditingController1;
  TextEditingController? textEditingController2;
  TextEditingController? textEditingController3;
  TextEditingController? textEditingController4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    textEditingController3 = TextEditingController();
    textEditingController4 = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController1!.dispose();
    textEditingController2!.dispose();
    textEditingController3!.dispose();
    textEditingController4!.dispose();
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
                height: 100,
              ),
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 14),
                child: Text(
                  "Create\nAccount",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.4,
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1),
                ),
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
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                hintText: "E-mail",
              ),
              InputField(
                controller: textEditingController3,
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: Colors.white,
                ),
                hintText: "Phone Number",
              ),
              InputField(
                controller: textEditingController4,
                prefixIcon: Icon(
                  Icons.brush_outlined,
                  color: Colors.white,
                ),
                hintText: "Password",
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  // userToJson(User(
                  //   userName: textEditingController1!.text.toString().trim(),
                  //   email: textEditingController2!.text.toString().trim(),
                  //   phoneNumber: textEditingController3!.text.toString().trim(),
                  //   password: textEditingController4!.text.toString().trim(),
                  // ));
                  HiveDB().saveData(
                    // User.fromJson({
                    //   "userName":
                    //       textEditingController1!.text.toString().trim(),
                    //   "email": textEditingController2!.text.toString().trim(),
                    //   "phoneNumber":
                    //       textEditingController3!.text.toString().trim(),
                    //   "password":
                    //       textEditingController4!.text.toString().trim(),
                    // }),
                      userToJson(User(
                        userName: textEditingController1!.text.toString().trim(),
                        email: textEditingController2!.text.toString().trim(),
                        phoneNumber: textEditingController3!.text.toString().trim(),
                        password: textEditingController4!.text.toString().trim(),
                      ))
                  );
                  print("processed");

                  User user1 = await HiveDB().loadData();
                  print(user1.userName);
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
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                          letterSpacing: 1.1),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
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
