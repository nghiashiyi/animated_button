import 'package:animated_progress_button/animated_progress_button.dart';
import 'package:flutter/material.dart';

Color mainColor = Color(0xFF41CEBB);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final animatedButtonController = AnimatedButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6F4),
      appBar: AppBar(
        leading: BackButton(color: mainColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        actions: <Widget>[FlatButton(onPressed: () {}, child: Text("Sign up"))],
      ),
      body: Column(
        children: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text("Log in",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          )),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 8.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 6.0, spreadRadius: 2.0)
                ]),
            child: ClipOval(
              child: Image.network(
                "https://iv1.lisimg.com/image/16128926/480full-isa-longwell.jpg",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 56.0, left: 28.0, right: 28.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3),
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 1.0)
                ]),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: "Password"),
                  cursorColor: mainColor,
                  obscureText: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 115,right: 115),
            child: AnimatedButton(
              height: 40,
              color: Colors.white,
              bordercolor: Colors.orange,
              shadowColor: Colors.orange,
               fontcolor: Colors.black,
              text: 'Add',
               loadedIcon: Icon(Icons.check, color: Colors.black),
              controller: animatedButtonController,
              onPressed: () async {
                /// calling your API here and wait for the response.
                await Future.delayed(
                    Duration(seconds: 1)); // simulated your API request.
                animatedButtonController.completed();
                await Future.delayed(Duration(seconds: 2));
                animatedButtonController.reset(); // call to reset button
              },
            ),
          ),
        ],
      ),
    );
  }
}
