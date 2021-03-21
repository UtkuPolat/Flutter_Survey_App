import 'package:akserapp/Pages/signIn.dart';
import 'package:akserapp/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'navigation.dart';

class RegisterContinue extends StatefulWidget {
  final String registrationEmailValid;
  final String registrationPasswordValid;
  RegisterContinue(
      {Key key, this.registrationEmailValid, this.registrationPasswordValid})
      : super(key: key);

  @override
  _RegisterContinueState createState() => _RegisterContinueState();
}

class _RegisterContinueState extends State<RegisterContinue> {
  String verificationId;
  String _warning;
  String phoneIsoCode;
  String _phone;

  String _registrationName = '',
      _registrationSurname = '',
      _registrationPhone = '',
      _birthDay = '',
      _registerEmail = '',
      _registerPassword = '',
      _character = '';
  int _radioValue1;

  void setEmailAndPassword() {
    setState(() {
      _registerEmail = widget.registrationEmailValid;
      _registerPassword = widget.registrationPasswordValid;
    });
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
    });
    if (_radioValue1 == 0) {
      setState(() {
        _character = 'Woman';
      });
    }
    if (_radioValue1 == 1) {
      setState(() {
        _character = 'Man';
      });
    }
    if (_radioValue1 == 2) {
      setState(() {
        _character = 'Other';
      });
    }
  }

  final GlobalKey<FormState> _registerKey2 = GlobalKey<FormState>();
  void moveToLogin() {
    _registerKey2.currentState.reset();
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneIsoCode = isoCode;
      _registrationPhone = internationalizedPhoneNumber;
    });
  }

  DateTime _dateTime = new DateTime.now();

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
                key: _registerKey2,
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
                          'User Informations',
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
                              'Name',
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
                                  color: Colors.black,
                                  fontFamily: 'OpenSans',
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14.0),
                                  labelText: 'Please Write Your Name',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  labelStyle: kHintTextStyle,
                                ),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                validator: (String input) {
                                  if (input.isEmpty) {
                                    return 'Name is Required';
                                  }
                                  return null;
                                },
                                onSaved: (String input) {
                                  String firstChar = input[0].toUpperCase();
                                  _registrationName = firstChar +
                                      input.substring(1, input.length);
                                },
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Surname',
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
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.only(top: 14.0),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      ),
                                      labelText: 'Please Write Your Surname',
                                      labelStyle: kHintTextStyle,
                                    ),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    validator: (String input) {
                                      if (input.isEmpty) {
                                        return 'Surname is Required';
                                      }
                                      return null;
                                    },
                                    onSaved: (String input) {
                                      String firstChar = input[0].toUpperCase();
                                      _registrationSurname = firstChar +
                                          input.substring(1, input.length);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Phone Number',
                                  style: kLabelStyle,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: kBoxDecorationStyle,
                                  height: 60.0,
                                  child: InternationalPhoneInput(
                                    decoration: InputDecoration.collapsed(
                                      border: InputBorder.none,
                                      hintText: 'Write Your Phone Number',
                                      hintStyle: kHintTextStyle,
                                    ),
                                    onPhoneNumberChange: onPhoneNumberChange,
                                    initialPhoneNumber: _registrationPhone,
                                    initialSelection: 'TR',
                                    showCountryCodes: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Birthday',
                                  style: kLabelStyle,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: kBoxDecorationStyle,
                                  height: 60.0,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime(1999, 1, 1),
                                    maximumDate: DateTime(2010, 1, 1),
                                    onDateTimeChanged: (DateTime value) {
                                      setState(() {
                                        if (value == DateTime(1999, 1, 1) ||
                                            value == null) {
                                          return 'Please Select Your Birthday';
                                        } else {
                                          _dateTime = value;
                                          _birthDay = _dateTime.toString();
                                          _birthDay =
                                              _birthDay.substring(0, 10);
                                        }
                                      });
                                    },
                                    use24hFormat: false,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Gender',
                                  style: kLabelStyle,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: kBoxDecorationStyle,
                                  height: 60.0,
                                  child: new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      new Radio(
                                        value: 0,
                                        groupValue: _radioValue1,
                                        activeColor: Colors.black,
                                        focusColor: Colors.white,
                                        onChanged: _handleRadioValueChange1,
                                      ),
                                      new Text(
                                        'Female',
                                        style: kLabelStyle,
                                      ),
                                      new Radio(
                                        value: 1,
                                        groupValue: _radioValue1,
                                        activeColor: Colors.black,
                                        focusColor: Colors.white,
                                        onChanged: _handleRadioValueChange1,
                                      ),
                                      new Text(
                                        'Male',
                                        style: kLabelStyle,
                                      ),
                                      new Radio(
                                        value: 2,
                                        groupValue: _radioValue1,
                                        activeColor: Colors.black,
                                        focusColor: Colors.white,
                                        onChanged: _handleRadioValueChange1,
                                      ),
                                      new Text(
                                        'Other',
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
                                      'SIGN UP',
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
    if (_warning != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.error_outline),
            Expanded(
                child: Text(
              _warning,
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

  /*Future<Map<FirebaseUser, dynamic>> getData() async {
    return Future.delayed(Duration(seconds: 1), () => {});
  }

  void _loadCurrentUser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      setState(() {
        this.currentUser = user;
      });
    });
  }

  @override
  void initState() {
    _loadCurrentUser();
    super.initState();
  }

  void setDatabase() {
    final formState = _registerKey2.currentState;
    formState.save();
    setEmailAndPassword();

    if (formState.validate()) {
      if (_registrationPhone == '') {
        setState(() {
          _warning = 'Your Phone Number could not be Validated';
        });
      } else {
        setState(() {
          Firestore.instance
              .collection('UserAccounts')
              .document(currentUser.uid)
              .setData({
            'Email': _registerEmail,
            'Name': _registrationName,
            'Surname': _registrationSurname,
            'Password': _registerPassword,
            'Phone Number': _registrationPhone,
            'Birthday': _birthDay,
            'Gender': _character,
          });
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Navigation(user: user)));
      }
      try {} catch (e) {
        print(e.message);
        setState(() {
          _warning = e.message;
        });
      }
    }
  }*/
}
