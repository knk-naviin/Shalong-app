import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _ConfirmpasswordController = TextEditingController();
  final _phonenumber = TextEditingController();
  final _emailController = TextEditingController();
  late String firstname, lastname, email, password, confirmpassword, phone;
  bool switchState = false;
  CollectionReference userRef = FirebaseFirestore.instance.collection("user");

  void signin() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: confirmpassword).then((value) {
      print(value);
      addUser(value.user!.uid);
    }).catchError((onError) {
      FirebaseAuthException exp = onError;
      if (exp.message != null) {

        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(title: Text(exp.message!));
        });
      }
    });
  }

  Future<void> addUser(String uid) async {
    userRef.add({
      "uid": uid,
      "firstname":firstname,
      "lastname":lastname,
      "email": email,
      "password":confirmpassword,
      "phone":phone
    }).then((value) {
      Navigator.of(context).pushReplacementNamed("/launch");
    }).catchError((onError) {
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(title: Text(onError.toString()));
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New User Registration"),
        backgroundColor: CupertinoColors.systemBlue,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                              "https://assets.turbologo.com/blog/en/2019/11/19084834/gaming-logo-cover.jpg"),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, bottom: 15.0, top: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: 190,
                            child: TextFormField(
                              onSaved: (value) {
                                firstname = value!;
                              },
                              validator: (firstname) {
                                if (firstname!.isEmpty)
                                  return "Please Enter first name";
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "First Name ",
                                  prefixIcon: Icon(
                                    CupertinoIcons.person,
                                    color: CupertinoColors.systemBlue,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: SizedBox(
                            width: 190,
                            child: TextFormField(
                              onSaved: (value) {
                                lastname = value!;
                              },
                              validator: (secondname) {
                                if (secondname!.isEmpty)
                                  return "Please Enter Last name";
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "last Name",
                                  prefixIcon: Icon(
                                    CupertinoIcons.person,
                                    color: CupertinoColors.systemBlue,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 400,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        //controller: _emailController,
                        onSaved: (value) {
                          email = value!;
                        },
                        validator: (email) {
                          if (email!.contains("@"))
                            return null;
                          else {
                            return "Enter valid email address";
                          }
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
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        onSaved: (value) {
                          password = value!;
                        },
                        validator: (password) {
                          if (password!.isEmpty) {
                            return "Please Enter Password";
                          } else if (password.length < 8 ||
                              password.length > 15) {
                            return "Your Password Contains Minimum 8 Character";
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter Password",
                            prefixIcon: Icon(
                              CupertinoIcons.lock_open,
                              color: CupertinoColors.systemBlue,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: _ConfirmpasswordController,
                        obscureText: true,
                        onSaved: (value) {
                          confirmpassword = value!;
                        },
                        validator: (value) {
                          if (value != _passwordController.value.text) {
                            return "Password do not matches";
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter confirm Password",
                            prefixIcon: Icon(
                              CupertinoIcons.lock,
                              color: CupertinoColors.systemBlue,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 400,
                      child: TextFormField(
                        controller: _phonenumber,
                        keyboardType: TextInputType.number,
                        //obscureText: true,
                        onSaved: (value) {
                          phone = value!;
                        },
                        validator: (phone) {
                          if (phone!.isEmpty) {
                            return "Please Enter your phone number";
                          } else if (phone.isNotEmpty) {
                            return null;
                          } else if (phone.length == 10) {
                            return "Incorrect phone number";
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter phone number",
                            prefixIcon: Icon(
                              CupertinoIcons.lock,
                              color: CupertinoColors.systemBlue,
                            )),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child:
                            SizedBox(child: Text("Accept Terms & Conditions ")),
                      ),
                      CupertinoSwitch(
                          activeColor: CupertinoColors.systemBlue,
                          value: switchState,
                          onChanged: (bool value) {
                            setState(() {
                              switchState = value;
                            });
                          }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CupertinoButton(
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 23),
                      ),
                      color: CupertinoColors.systemBlue,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          (formKey.currentState!.save());
                          signin();
                          print(firstname);
                          print(lastname);
                          print(_emailController);
                          print(_passwordController);
                          print(_phonenumber);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
