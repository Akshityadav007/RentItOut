import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './mainScreen.dart';

class CreateAccount extends StatefulWidget {
  static const String id = 'create_account';
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<CreateAccount> {
  bool _isChecked = false;
  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    String email, name, phone, password;
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple[900], Colors.purple[600]],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: [0.0, 12.0]),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 10, right: 10),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new TextField(
                      onChanged: (val) {
                        name = val;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: 'Full Name',
                          hintStyle: TextStyle(color: Colors.white70),
                          icon: Icon(
                            Icons.person_outline,
                            color: Colors.white70,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    new TextField(
                      onChanged: (val) {
                        email = val;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          icon: Icon(
                            Icons.mail,
                            color: Colors.white70,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    new TextField(
                      onChanged: (val) {
                        phone = val;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: Colors.white70),
                          icon: Icon(
                            Icons.call,
                            color: Colors.white70,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    new TextField(
                      obscureText: true,
                      onChanged: (val) {
                        password = val;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white70),
                          icon: Icon(
                            Icons.security,
                            color: Colors.white70,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            checkColor: Colors.white,
                            onChanged: (bool value) {
                              onChanged(value);
                            },
                            value: _isChecked),
                        Text(
                          'I am a property consultant.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: OutlineButton(
                        splashColor: Colors.purpleAccent,
                        borderSide:
                            BorderSide(width: 1.5, color: Colors.white70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () async {
                          print(name);
                          print(phone);
                          print(password);
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            if (newUser != null) {
                              Navigator.pushNamed(context, MainScreen.id);
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(
                          'Create Account',
                          style: TextStyle(fontSize: 22, color: Colors.white70),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, right: 10, left: 15),
                      child: Text(
                        'Details taken are for RIO use only,we will not provide or leak this data to any third person.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Text(
                        'By using RIO,you agree to RIO\'s\n Terms of Use and Privacy.',
                        style: TextStyle(color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
