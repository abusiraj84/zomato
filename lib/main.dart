import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('DELICIOUS TURKISH FOOD',
                      style: TextStyle(color: Colors.grey[500])),
                  Row(
                    children: <Widget>[
                      Text('See all', style: TextStyle(color: Colors.red)),
                      Icon(Icons.arrow_right, color: Colors.red),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xfff35437),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
