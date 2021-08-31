import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shalong/UserAuthentication/OTPAuth/PhoneAuth.dart';



class OtpLogin extends StatefulWidget {
  const OtpLogin({Key? key}) : super(key: key);

  @override
  _OtpLoginState createState() => _OtpLoginState();
}

class _OtpLoginState extends State<OtpLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PhoneAuth()));
              }, icon: FaIcon(FontAwesomeIcons.phone,color: Colors.white,), label:Text("Sign Up With OTP"))
            ],
          ),
        ],
      ),
    );
  }
}
