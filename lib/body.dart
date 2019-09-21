import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './create_account.dart';
import './mainScreen.dart';
import './pre/my_flutter_app_icons.dart' as CustomIcon;
import './pre/google_icon_icons.dart' as CustomIcons;

class MyBodyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RIO',
        initialRoute: HomeScreen.id,
        routes: <String, WidgetBuilder>{
          HomeScreen.id: (BuildContext context) => HomeScreen(),
          MoreLogin.id: (BuildContext context) => MoreLogin(),
          CreateAccount.id: (BuildContext context) => CreateAccount(),
          MainScreen.id: (BuildContext context) => MainScreen(),
        },
        home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  static const id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RIO',
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
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 100, right: 100),
                  child: Text(
                    'Welcome to RIO.',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 150, left: 20, bottom: 10, right: 20),
                  child: RaisedButton(
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.5),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Icon(
                                CustomIcon.MyFlutterApp.facebook,
                                color: Colors.purple,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              (Text(
                                'Continue with Facebook',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w400),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: 350,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: OutlineButton(
                        splashColor: Colors.purpleAccent,
                        borderSide: BorderSide(width: 1.5, color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.of(context).pushNamed(CreateAccount.id);
                        },
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Text(
                          'Create Account',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        )),
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MoreLogin.id);
                    },
                    child: Text(
                      'More Options',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 100),
                      child: Text(
                        'By using RIO, you agree to RIO\'s\nTerms of Use and Privacy Policy.\n2019 \u00a9 RIO Rentals Pvt. Ltd.',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MoreLogin extends StatefulWidget {
  static const id = "MoreLogin";

  @override
  _MoreLoginState createState() => _MoreLoginState();
}

class _MoreLoginState extends State<MoreLogin> {
  bool _isLoggedIn = false;
  GoogleSignIn _googleSignIn = new GoogleSignIn(scopes: ['email']);
  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (e) {
      print(e);
    }
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RIO',
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple[900], Colors.purple[600]],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: [0.0, 12.0]),
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  height: 55,
                  margin: EdgeInsets.only(top: 200, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: RaisedButton(
                    splashColor: Colors.white30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_isLoggedIn = false) {
                        _login();
                      } else if (_isLoggedIn = true) {
                        Navigator.pushNamed(context, MainScreen.id);
                      } else {
                        Navigator.pushNamed(context, MoreLogin.id);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 1),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            CustomIcons.GoogleIcon.google,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Center(
                            child: Text('Google',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: RaisedButton(
                    splashColor: Colors.white30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 1),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.mail,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Center(
                            child: Text('Email',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: RaisedButton(
                    splashColor: Colors.white30,
                    // borderSide: BorderSide(width: 1.5, color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 1),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.call,
                            color: Colors.purple,
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Center(
                            child: Text('Phone Number',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      ),
                    ),
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
