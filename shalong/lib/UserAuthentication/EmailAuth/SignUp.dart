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
  late String firstname, lastname, email, password, confirmpassword, phone,shopName = "",shopno = "";
  bool switchState = false;
  CollectionReference userRef = FirebaseFirestore.instance.collection("user");

  void signin() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: confirmpassword)
        .then((value) {
      addUser(value.user!.uid);
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

  Future<void> addUser(String uid) async {
    userRef.add({
      "uid": uid,
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "phone": phone,
      "usertype": switchState,
      "shopname":shopName,
      "shopno":shopno
    }).then((value) {
      Navigator.of(context).pushReplacementNamed("/launch");
    }).catchError((onError) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
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
                            width: 162,
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
                              CupertinoIcons.phone_fill,
                              color: CupertinoColors.systemBlue,
                            )),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(child: Text("Are you barber?")),
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
                  Visibility(
                    visible: switchState == true ? true : false,
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                              width: 400,
                              child: TextFormField(
                                onSaved: (value) {
                                  shopName = value!;
                                },
                                validator: (value) {
                                  if (value!.isEmpty){
                                    return "Enter your shop name";
                                  }
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Enter Shop Name",
                                    prefixIcon: Icon(
                                      CupertinoIcons.home,
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
                                onSaved: (value) {
                                  shopno = value!;
                                },
                                validator: (value) {
                                  if (value!.isEmpty){
                                    return "Enter your Shop phone number";
                                  }
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Enter Shop phone number",
                                    prefixIcon: Icon(
                                      CupertinoIcons.phone_fill,
                                      color: CupertinoColors.systemBlue,
                                    )),
                              ),
                            ),
                          ),
                        ],

                  )),
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
                          print("usertype saved $switchState");
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
