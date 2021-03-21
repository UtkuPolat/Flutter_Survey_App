import 'package:akserapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:toast/toast.dart';

class UserInformations extends StatefulWidget {
  UserInformations({Key key}) : super(key: key);
  @override
  _UserInformationsState createState() => _UserInformationsState();
}

class _UserInformationsState extends State<UserInformations> {
  String phoneIsoCode;
  String updatedEmail;
  String updatedName;
  String updatedSurname;
  String updatedPhone;
  String _error;

  @override
  Widget build(BuildContext context) {
    Future<String> data(String document) async {
      /*var data1 = (await Firestore.instance
              .collection('UserAccounts')
              .document(currUser.uid)
              .get())
          .data['$document'];
      return data1;*/
    }
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFCCBC),
              Color(0xFFFFAB91),
              Color(0xFFFF8A65),
              Color(0xFFFF7043),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 80.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.account_circle,
                size: 200,
                color: Colors.black54,
              ),
              Text(
                'User',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Informations',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Double Click: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'If You Will Change Any Information',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(
                    color: Colors.white54,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 55.0,
                width: 350,
                child: GestureDetector(
                  onDoubleTap: () => _changingAlertsForUser('Name'),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_box,
                        color: Colors.white,
                      ),
                      Text(
                        ' Name: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FutureBuilder(
                        future: data('Name'),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data,
                              style: TextStyle(
                                color: Colors.black87,
                                fontFamily: 'OpenSans',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            );
                          } else if (snapshot.hasError) {
                            return Center();
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(
                    color: Colors.white54,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 55.0,
                width: 350,
                child: GestureDetector(
                  onDoubleTap: () => _changingAlertsForUser('Surname'),
                  child: Row(
                    children: [
                      Icon(
                        Icons.group,
                        color: Colors.white,
                      ),
                      Text(
                        ' Surname: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FutureBuilder(
                        future: data('Surname'),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data,
                              style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center();
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(
                    color: Colors.white54,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 55.0,
                width: 350,
                child: GestureDetector(
                  onDoubleTap: () async {
                    /*GoogleSignIn googleUser = new GoogleSignIn();
                    if (currUser.isEmailVerified ==
                        await googleUser.isSignedIn()) {
                      _showMyDialog('You can not change your google account');
                    } else {
                      _changingAlertsForUser('Email');
                    }*/
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        Text(
                          ' Email: ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FutureBuilder(
                          future: data('Email'),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 17,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center();
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  border: Border.all(
                    color: Colors.white54,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 55.0,
                width: 350,
                child: GestureDetector(
                  onDoubleTap: () => _changingAlertPhone(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        Text(
                          ' Phone Number:',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FutureBuilder(
                          future: data('Phone Number'),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data,
                                style: TextStyle(
                                  fontSize: 17,
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center();
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onDoubleTap: () {
                  _showMyDialog('You can not change your Gender');
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    border: Border.all(
                      color: Colors.white54,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 55.0,
                  width: 350,
                  child: Row(
                    children: [
                      Icon(
                        Icons.tag_faces,
                        color: Colors.white,
                      ),
                      Text(
                        ' Gender: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FutureBuilder(
                        future: data('Gender'),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data,
                              style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center();
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onDoubleTap: () {
                  _showMyDialog('You can not change your Birthday');
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    border: Border.all(
                      color: Colors.white54,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 55.0,
                  width: 350,
                  child: Row(
                    children: [
                      Icon(
                        Icons.cake,
                        color: Colors.white,
                      ),
                      Text(
                        ' Birthday: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FutureBuilder(
                        future: data('Birthday'),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data,
                              style: TextStyle(
                                fontSize: 17,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center();
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white54,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(String error) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFF7043),
          title: Text(
            'Error',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(error),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Approve',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /*_updateData(String document, String documentName) async {
    final db = Firestore.instance;
    await db.collection("UserAccounts").document(currUser.uid).updateData({
      '$documentName': document,
    });
    setState(() {});
  }

  updateEmail(String updatedEmail) async {
    try {
      FirebaseUser firebaseUser = currUser;
      await firebaseUser.updateEmail(updatedEmail);
    } catch (e) {
      setState(() {
        _error = e.message;
      });
      _showMyDialog(_error);
    }
    setState(() {});
  }*/

  Future<void> _changingAlertsForUser(String documentName) async {
    String changeData;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFFF7043),
          title: Text(
            'Please Enter The New \"$documentName\"',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8A65),
                    border: Border.all(
                      color: Colors.white54,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    obscureText: false,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      labelStyle: kHintTextStyle,
                      hintText: 'Please Tap Here',
                      hintStyle: kHintTextStyle,
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    onChanged: (newValue) async {
                      setState(() {
                        changeData = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Update',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                Toast.show(
                  'Your $documentName Changed Successfully',
                  context,
                  duration: 5,
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _changingAlertPhone() async {
    String changePhone = '';
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          child: AlertDialog(
            backgroundColor: Color(0xFFFF7043),
            title: Text(
              'Please Enter The New "Phone Number"',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(20, 14, 20, 14),
                decoration: BoxDecoration(
                  color: Color(0xFFFF8A65),
                  border: Border.all(
                    color: Colors.white54,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListBody(
                  children: <Widget>[
                    InternationalPhoneInput(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: kHintTextStyle,
                      ),
                      onPhoneNumberChange: onPhoneNumberChange,
                      initialPhoneNumber: changePhone,
                      initialSelection: 'TR',
                      showCountryCodes: true,
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Toast.show(
                    'Your Phone Number Changed Successfully',
                    context,
                    duration: 5,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneIsoCode = isoCode;
      updatedPhone = internationalizedPhoneNumber;
    });
  }
}
