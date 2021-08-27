import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
   late String forgotemail;
void forgotmail(){
  FirebaseAuth.instance
      .sendPasswordResetEmail(email: forgotemail).then((value) {
    FirebaseAuthException exp = "Your Password reset has been send to your email" as FirebaseAuthException;
    if (exp.message != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(title: Text(exp.message!));
          });
    }
  }).catchError((onError){
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
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
              appBar: AppBar(
                title: Text("Forgot Password"),
                centerTitle: true,
                backgroundColor: CupertinoColors.systemBlue,
              ),
              body: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Enter your EMail",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SizedBox(
                          width: 375,
                          child: TextFormField(
                            onSaved: (value) {
                              forgotemail = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Mail address";
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Enter Your Email",
                                prefixIcon: Icon(
                                  CupertinoIcons.mail_solid,
                                  color: CupertinoColors.systemBlue,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 186.0, top: 18),
                      child: SizedBox(

                        child: CupertinoButton(
                            minSize: 10,
                            color: CupertinoColors.systemBlue,
                            child: Text("Submit"),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                (formKey.currentState!.save());
                                forgotmail();
                              }
                            }),
                      ),
                    )
                  ],
                ),
              )),
        );
      }
    }
