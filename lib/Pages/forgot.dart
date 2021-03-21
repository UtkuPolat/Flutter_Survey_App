import 'package:akserapp/Pages/signIn.dart';
import 'package:akserapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class Forgot extends StatefulWidget {
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController editContoller = TextEditingController();
  void moveToLogin() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  String _error;

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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  showAlert(),
                  SizedBox(
                    height: 120.0,
                  ),
                  Text(
                    'Forgot Your Password?',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    height: 60.0,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                      controller: editContoller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        labelText: 'Please Write Your Email',
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
                  SizedBox(
                    height: 10,
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
                        resetPassword(context);
                      },
                      child: Text(
                        'RESET',
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
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'I Remember My Password ',
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

  void resetPassword(BuildContext context) async {
    try {
      if (editContoller.text.length == 0) {
        Toast.show('Enter Valid Email Address', context, duration: 5);
      } else {
        //await FirebaseAuth.instance
        //.sendPasswordResetEmail(email: editContoller.text);
        Toast.show(
            'Reset Password Link has sent your mail Please Use It to Change The Password',
            context,
            duration: 5);
        Navigator.pop(context);
      }
    } catch (e) {
      setState(() {
        _error = e.message;
      });
    }
  }
}
