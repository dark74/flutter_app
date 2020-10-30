import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //1.title row
    Widget titleRow = new Container(
      padding: EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  "Oeschinen Lake Campground",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(color: Colors.black26),
              ),
            ],
          )),
          new Icon(
            Icons.star,
            color: Colors.red,
          ),
          new Text('41'),
        ],
      ),
    );

    //build icon and text Column
    Column buildIconTextColum(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(
            icon,
            color: color,
          ),
          new Container(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                color: color,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      );
    }

    //2.button row
    Widget buttomRow = new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildIconTextColum(Icons.call, "CALL"),
        buildIconTextColum(Icons.near_me, "ROUTE"),
        buildIconTextColum(Icons.share, "SHARE")
      ],
    );

    //3.text row
    Widget textRow = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
        style: new TextStyle(fontSize: 12.0, color: Colors.grey),
        softWrap: true,
      ),
    );

    //4. big image row
    Widget headImageIcon = new Image.asset(
      'images/lake.jpg',
      height: 240.0,
      fit: BoxFit.cover,
    );

    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Scaffold(
        body: new ListView(
          children: [
            headImageIcon,
            titleRow,
            buttomRow,
            textRow,
          ],
        ),
      ),
    );
  }
}
