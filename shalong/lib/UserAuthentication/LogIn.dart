import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';


class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100.0),
                      child: Image.asset("images/Logo.jpeg"),
                    ),
                    Container(
                      width: 123,
                      height: 124,
                      decoration: BoxDecoration(
                        gradient:  LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.blue
                            ]
                        ),
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200.0),
                      child: SizedBox(
                          child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: CupertinoColors.systemRed,
                                    fontSize: 67,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: SizedBox(
                    width: 350,
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
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: CupertinoColors.systemBlue)),
                          border: OutlineInputBorder(),
                          labelText: "Enter Your Email Address",
                          prefixIcon: Icon(
                            CupertinoIcons.mail_solid,
                            color: CupertinoColors.systemRed,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    width: 350,
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
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: CupertinoColors.systemBlue)),
                          labelText: "Enter Your Password",
                          prefixIcon: Icon(
                            CupertinoIcons.lock_fill,
                            color: CupertinoColors.systemRed,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CupertinoButton(
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 23),
                      ),
                      color: CupertinoColors.systemRed,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          (formKey.currentState!.save());
                        }
                      }
                      //color: CupertinoColors.systemBlue,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: Text("New Registration")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
