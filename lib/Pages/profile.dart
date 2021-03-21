import 'dart:collection';
import 'package:akserapp/Pages/userInfos.dart';
import 'package:flutter/material.dart';
import 'package:akserapp/src/utils/screen_size.dart';
import 'package:akserapp/src/widgets/donut_charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:akserapp/src/widgets/percent_indicator.dart';
import 'package:akserapp/src/widgets/wave_progress.dart';

var data = [
  new DataPerItem('Home', 35, Colors.greenAccent),
  new DataPerItem('Food & Drink', 25, Colors.yellow),
  new DataPerItem('Hotel & Restaurant', 24, Colors.indigo),
  new DataPerItem('Travelling', 40, Colors.pinkAccent),
];

var series = [
  new charts.Series(
    domainFn: (DataPerItem clickData, _) => clickData.name,
    measureFn: (DataPerItem clickData, _) => clickData.percent,
    colorFn: (DataPerItem clickData, _) => clickData.color,
    id: 'Item',
    data: data,
  ),
];

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    //_loadCurrentUser();
    super.initState();
  }

  /*void _loadCurrentUser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      setState(() {
        this.currentUser = user;
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    /*Future<String> data(String document) async {
      var data1 = (await Firestore.instance
              .collection('UserAccounts')
              .document(currentUser.uid)
              .get())
          .data['$document'];
      return data1;
    }*/

    final _media = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 20,
          top: 70,
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FutureBuilder(
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center();
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              FutureBuilder(
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
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
          SizedBox(
            height: 25,
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserInformations(
                    //currentUser: currentUser,
                    ),
              ),
            ),
            child: Text(
              "User Informations",
              maxLines: 3,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
          Text(
            "User Account",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              inherit: true,
              letterSpacing: 0.4,
            ),
          ),
          Row(
            children: <Widget>[
              colorCard("Coin", 50, 1, context, Color(0xFF1b5bff)),
              //colorCard("Credit Debt", 4320, -1, context, Color(0xFFff3f5e)),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Surveys",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),
                TextSpan(
                  text: "    August 2020",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Varela",
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            height:
                screenAwareSize(_media.longestSide <= 775 ? 180 : 130, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 180,
                  width: 160,
                  child: DonutPieChart(
                    series,
                    animate: true,
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      donutCard(Colors.indigo, "Media Markt"),
                      donutCard(Colors.yellow, "Akser Yazılım"),
                      donutCard(Colors.greenAccent, "Vatan Bilgisayar"),
                      donutCard(Colors.pinkAccent, "Havelsan"),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Recent Surveys",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Varela",
                  ),
                ),
                TextSpan(
                  text: "    August",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Varela",
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 20,
            ),
            padding: EdgeInsets.all(10),
            height: screenAwareSize(45, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 6,
                  spreadRadius: 10,
                )
              ],
            ),
            child: LinearPercentIndicator(
              width: screenAwareSize(
                  _media.width - (_media.longestSide <= 775 ? 100 : 160),
                  context),
              lineHeight: 20.0,
              percent: 0.68,
              backgroundColor: Colors.grey.shade300,
              progressColor: Color(0xFF1b52ff),
              animation: true,
              animateFromLastPercent: true,
              alignment: MainAxisAlignment.spaceEvenly,
              animationDuration: 1000,
              linearStrokeCap: LinearStrokeCap.roundAll,
              center: Text(
                "68.0%",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Total Surveys",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              inherit: true,
              letterSpacing: 0.4,
            ),
          ),
          vaweCard(
            context,
            "Earned",
            200,
            1,
            Colors.grey.shade100,
            Color(0xFF716cff),
          ),
          /*vaweCard(
            context,
            "Spent",
            3210,
            -1,
            Colors.grey.shade100,
            Color(0xFFff596b),
          ),*/
        ],
      ),
    );
  }

  Widget vaweCard(BuildContext context, String name, double amount, int type,
      Color fillColor, Color bgColor) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        right: 20,
      ),
      padding: EdgeInsets.only(left: 15),
      height: screenAwareSize(80, context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 6,
            spreadRadius: 10,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              WaveProgress(
                screenAwareSize(45, context),
                fillColor,
                bgColor,
                67,
              ),
              Text(
                "200",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${type > 0 ? "" : "-"} \Earned Coin: ${amount.toString()}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget donutCard(Color color, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 0,
            top: 18,
            right: 10,
          ),
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            inherit: true,
          ),
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        )
      ],
    );
  }

  Widget colorCard(
      String text, double amount, int type, BuildContext context, Color color) {
    final _media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      padding: EdgeInsets.all(15),
      height: screenAwareSize(90, context),
      width: _media.width / 2 - 25,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 16,
                spreadRadius: 0.2,
                offset: Offset(0, 8)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${type > 0 ? "" : "-"} ${amount.toString()}", //"${type > 0 ? "" : "-"} \$ ${amount.toString()}"
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
