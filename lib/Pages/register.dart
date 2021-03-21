import 'package:akserapp/Pages/register2.dart';
import 'package:akserapp/Pages/signIn.dart';
import 'package:akserapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './register2.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _registrationEmail = '',
      _registrationPassword = '',
      _reWritePassword = '',
      _registrationName = '',
      _registrationSurname = '',
      _registrationPhone = '',
      _age = '',
      _character = '';
  String _error;

  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _routeEmail = TextEditingController();

  void moveToLogin() {
    _registerKey.currentState.reset();
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
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
              SizedBox(height: _height * 0.025),
              showAlert(),
              SizedBox(height: _height * 0.025),
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
                key: _registerKey,
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
                        Text(
                          'Sign Up',
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
                          children: [
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
                                controller: _routeEmail,
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Email Necessary for Registration';
                                  }
                                  if (!RegExp(
                                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                      .hasMatch(input)) {
                                    return 'Please Enter a Valid Email Address';
                                  }
                                  return null;
                                },
                                onSaved: (input) => _registrationEmail = input,
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
                            SizedBox(height: 10.0),
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
                                    controller: _pass,
                                    validator: (input) {
                                      if (input.length < 6) {
                                        return 'Your Password Needs to be At Least 6 Characters.';
                                      }
                                      return null;
                                    },
                                    onSaved: (input) =>
                                        _registrationPassword = input,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(top: 14.0),
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
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Confirm Password',
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
                                    controller: _confirmPass,
                                    validator: (value) {
                                      if (value != _pass.text) {
                                        return 'Password do not match';
                                      }
                                      if (value.isEmpty) {
                                        return 'Please Rewrite Password';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) =>
                                        _reWritePassword = value,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(top: 14.0),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      ),
                                      labelText: 'Rewrite Your Password',
                                      labelStyle: kHintTextStyle,
                                    ),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    obscureText: true,
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
                                    onPressed: () {
                                      signUp();
                                    },
                                    child: Text(
                                      'NEXT',
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
                                GestureDetector(
                                  onTap: () {
                                    moveToLogin();
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Do you have an Account? ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Sign In',
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
                          ],
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
          children: [
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

  Future<void> signUp() async {
    final formState = _registerKey.currentState;
    if (formState.validate()) {
      _registerKey.currentState.save();
      try {
        //FirebaseUser user = (await FirebaseAuth.instance
        //        .createUserWithEmailAndPassword(
        //            email: _registrationEmail, password: _registrationPassword))
        //    .user;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterContinue(
              registrationEmailValid: _routeEmail.text,
              registrationPasswordValid: _pass.text,
            ),
          ),
        );
      } catch (e) {
        print(e.message);
        setState(() {
          _error = e.message;
        });
      }
    }
  }
}
