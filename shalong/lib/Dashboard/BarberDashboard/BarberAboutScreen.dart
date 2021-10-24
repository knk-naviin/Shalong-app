import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BarberAboutScreen extends StatefulWidget {
  const BarberAboutScreen({Key? key}) : super(key: key);

  @override
  _BarberAboutScreenState createState() => _BarberAboutScreenState();
}

class _BarberAboutScreenState extends State<BarberAboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Help"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey, Colors.black26])),
          ),
          backgroundColor: Colors.white12,
          elevation: 0,

        ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Divider(
            //   color: Colors.grey,
            // ),
            Html(
              data: """
          <div class="about-section">
          <h2 style="text-align:center">About Us App</h2>

  <p>Shalong App is developed for Hair Grooming shop</p>
  <p>Resize the browser window to see that this page is responsive by the way.</p>
</div>

<h2 style="text-align:center">Our Team</h2>
<div class="row">
  <div class="column">
    <div class="card">
        <img src="/w3images/team1.jpg" alt="Jane" style="width:100%">
        <div class="container">
          <h2>Rajesh T</h2>
          <p class="title">CEO & Founder</p>
          <p>Github Account - rajesht1989 </p>
          <p>rajesht1989@gmail.com</p>
          <p><button class="button">Contact</button></p>
        </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
        <img src="/w3images/team2.jpg" alt="Mike" style="width:100%">
        <div class="container">
          <h2>Naveen K</h2>
          <p class="title">Developer</p>
          <p>Github Account - knk-naviin</p>
          <p>knknaveen28@gmail.com</p>
          <p><button class="button">Contact</button></p>
        </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
        <img src="/w3images/team3.jpg" alt="John" style="width:100%">
        <div class="container">
          <h2>Venkatesh K</h2>
          <p class="title">Developer</p>
          <p>Github Account - venki-1990</p>
          <p>venkateshjack1990@gmail.com</p>
          <p><button class="button">Contact</button></p>
        </div>
    </div>
  </div>
</div>
<div class="column">
    <div class="card">
        <img src="/w3images/team3.jpg" alt="John" style="width:100%">
        <div class="container">
          <h2>Vignesh M</h2>
          <p class="title">Developer</p>
          <p>Github Account - vickyadhi</p>
          <p>vickyadhi011@gmail.com</p>
          <p><button class="button">Contact</button></p>
        </div>
    </div>
  </div>
</div>
          """,
            ),
            Divider(),
            Text(
              "This App is Copyright © 2021 Yash School of technology",
              style: TextStyle(
                  fontSize: 10,
                  color: CupertinoColors.systemGrey),
            ),
            Text(
              "Version: 1.0.1",
              style: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 12
              ),
            ),

          ],
        ),
      ),
    );
  }
}
