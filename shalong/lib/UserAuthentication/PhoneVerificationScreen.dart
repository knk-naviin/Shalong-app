import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String phone;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Phone Verification"),
          backgroundColor: Colors.blue,
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 20, right: 40),
                child: Text(
                  "Enter Phone number For Verification",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 10, right: 40),
                child: Text(
                  "This number will be used for all ride related communication."
                  "You Shall receive an SMS with code for verification",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 5, right: 40),
                child: Text(
                  "This shalong app is available only for INDIA🇧🇴",
                  style:
                      TextStyle(fontSize: 18, color: CupertinoColors.systemRed),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: TextEditingController(text: "1234567890"),
                    style: TextStyle(fontSize: 26),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Phone Number to Continue";
                      } else if (value.length != 10) {
                        return "Your Phone Number Must Contains 10 Digits";
                      }
                    },
                    onSaved: (value) {
                      phone = value!;
                    },
                    keyboardType: TextInputType.phone,
                    decoration:
                        InputDecoration(helperText: "Enter Phone Number"),
                  ),
                ),
              ),
              SizedBox(
                width: 123,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        (formKey.currentState!.save());
                      }
                    },
                    child: Text("Next")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
