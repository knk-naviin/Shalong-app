import 'package:flutter/material.dart';

class CustomerAccountInfoScreen extends StatefulWidget {
  const CustomerAccountInfoScreen({Key? key}) : super(key: key);

  @override
  _CustomerAccountInfoScreenState createState() => _CustomerAccountInfoScreenState();
}

class _CustomerAccountInfoScreenState extends State<CustomerAccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account Information"),
      ),
    );
  }
}
