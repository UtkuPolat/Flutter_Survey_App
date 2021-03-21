import 'package:akserapp/Pages/forgot.dart';
import 'package:akserapp/Pages/register.dart';
import 'package:akserapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  bool isLoggedIn = false;

  SharedPreferences prefs;

  String _error;
  String _email = '';
  String _password = '';
  String emailPass = '';
  String passwordPass = '';
  bool _rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void moveToRegister() {
    _formKey.currentState.reset();
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Register()));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: _height * 0.025),
                        showAlert(),
                        SizedBox(height: _height * 0.025),
                        Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Email',
                              style: kLabelStyle,
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: kBoxDecorationStyle,
                              height: 60.0,
                              child: TextFormField(
                                obscureText: false,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Please Type an Email';
                                  }
                                  if (!RegExp(
                                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                      .hasMatch(input)) {
                                    return 'Please Enter a Valid Email Address';
                                  }
                                  return null;
                                },
                                onSaved: (input) => _email = input,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  labelText: 'Please Write a Valid Email',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  labelStyle: kHintTextStyle,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Password',
                              style: kLabelStyle,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: kBoxDecorationStyle,
                              height: 60.0,
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                ),
                                validator: (input) {
                                  if (input.length < 6) {
                                    return 'Your Password Needs to be at Least 6 Characters.';
                                  }
                                  return null;
                                },
                                onSaved: (input) => _password = input,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  labelText: 'Enter Your Password',
                                  labelStyle: kHintTextStyle,
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Forgot()));
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: kLabelStyle,
                                ),
                              ),
                            ),
                            Container(
                              height: 20.0,
                              child: Row(
                                children: <Widget>[
                                  Theme(
                                    data: ThemeData(
                                      unselectedWidgetColor: Colors.white,
                                    ),
                                    child: Checkbox(
                                      value: _rememberMe,
                                      checkColor: Colors.green,
                                      activeColor: Colors.white,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Remember me',
                                    style: kLabelStyle,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 25.0),
                              width: double.infinity,
                              child: RaisedButton(
                                elevation: 5.0,
                                padding: EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.white,
                                onPressed: () {},
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Color(0xFF527DAA),
                                    letterSpacing: 1.5,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 20.0),
                                Text(
                                  'Sign in with',
                                  style: kLabelStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            moveToRegister();
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don\'t have an Account? ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    );
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.error_outline),
            Expanded(
                child: Text(
              _error,
              maxLines: 3,
            ))
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }
}
