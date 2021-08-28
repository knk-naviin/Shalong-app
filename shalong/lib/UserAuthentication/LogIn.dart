
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ForgotPasswordScreen.dart';
import 'SignUp.dart';
import 'package:shalong/UserAuthentication/SignUp.dart';




class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}


class _LogInState extends State<LogIn> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password, forgotemail;

  void login() {

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {

          print("user credentials  $value");

          final firestoreInstance = FirebaseFirestore.instance;

          firestoreInstance.collection("user").get().then((querySnapshot) {
            querySnapshot.docs.forEach((result) {
              print(result.data());

              if(result.data()["userType"] == true)
              {
                print(result.data()["userType"]);

                Navigator.of(context).pushReplacementNamed("/barber");

              }
              else
              {
                Navigator.of(context).pushReplacementNamed("/customer");
              }
            });
          });
          print(value.additionalUserInfo!.profile!["userType"]);

    }).catchError((onError) {
      FirebaseAuthException exp = onError;
      if (exp.message != null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(title: Text(exp.message!));
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text("Login",
                    style: TextStyle(
                        fontSize: 66,
                        fontFamily: 'SourceCodePro',
                        color: CupertinoColors.systemBlue,
                        fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0, right: 38),
                child: SizedBox(
                  width: 375,
                  height: 90,
                  child: TextFormField(
                    onSaved: (value) {
                      email = value!;
                    },
                    validator: (email) {
                      if (email!.isEmpty)
                        return "Enter Your Email Address";
                      else if (email.contains("@")) return null;
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Your Email Address",
                        prefixIcon: Icon(
                          CupertinoIcons.mail_solid,
                          color: CupertinoColors.systemBlue,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0, right: 38.0),
                child: SizedBox(
                  width: 375,
                  child: TextFormField(
                    onSaved: (value) {
                      password = value!;
                    },
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "Please Enter Password";
                      } else if (password.length < 8 || password.length > 15) {
                        return "Your Password Contains Minimum 8 Character";
                      }
                    },
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    scrollPhysics: ScrollPhysics(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter Your Password",
                        prefixIcon: Icon(
                          CupertinoIcons.lock_fill,
                          color: CupertinoColors.systemBlue,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 250, right: 8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: CupertinoColors.systemRed),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CupertinoButton(
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 23),
                    ),
                    color: CupertinoColors.systemBlue,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        (formKey.currentState!.save());
                        login();
                      }
                    }),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text(
                    "New Registration",
                    style: TextStyle(color: CupertinoColors.systemBlue),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
