import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),
    ));

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 2,
        title: Text('Zomato',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: <Widget>[
          SectionName(),
          SizedBox(
            height: 240,
            child: Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FirstList(),
                  FirstList(),
                  FirstList(),
                  FirstList(),
                  FirstList(),
                  FirstList(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}



class SectionName extends StatelessWidget {
  const SectionName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding:
                const EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('DELICIOUS TURKISH FOOD',
                    style: TextStyle(color: Colors.grey[500])),
                Row(
                  children: <Widget>[
                    Text('See all', style: TextStyle(color: Colors.red[800])),
                    Icon(Icons.arrow_right, color: Colors.red[800]),
                  ],
                ),
              ],
            ),
          );
  }
}


class FirstList extends StatelessWidget {
  const FirstList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 150,
                height: 110,
                decoration: BoxDecoration(
                    color: Color(0xfff35437),
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.pexels.com/photos/277253/pexels-photo-277253.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                      ),
                      fit: BoxFit.cover,
                    )),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0),
                          ])),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 7,
                        right: 7,
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.green,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 4, bottom: 4, right: 4, left: 4),
                                child: Text('3.5',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 150,
            alignment: Alignment.bottomLeft,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Mangalci Et',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Quiq Bites',
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    )),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Bagcilar Merkez, Istanbul',
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
