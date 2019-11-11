import 'package:flutter/material.dart';
import 'api/foods/foods-api.dart';
import 'api/foods/foods.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                Text('Bagcilar Merkez',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15
                    )),
                Spacer(),
                Container(
                  padding:
                      EdgeInsets.only(top: 2, left: 5, right: 5, bottom: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.language,
                        size: 19,
                        color: Colors.black54,
                      ),
                      Text('EN',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://scontent.fist7-1.fna.fbcdn.net/v/t1.0-9/50110061_2134320890121979_165856286758404096_n.jpg?_nc_cat=109&_nc_oc=AQkPL2Kp2Ho5p50oSr_taQRsb0-9Lh60Hehf4QNhgEgp5--1mKLXBXlAlEwAXYhdMKQ&_nc_ht=scontent.fist7-1.fna&oh=c9e898340bd878827e209b1936e532c7&oe=5E55E808'),
                  radius: 13,
                )
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Container(
            height: 70,
            
            decoration: BoxDecoration(
             
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        borderSide: BorderSide(color: Colors.black)),
                    labelText: "Search for resturant, cafe..."),
                    
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          /////////////////////////////////

          _sectionname(title: 'DELICIOUS TURKISH FOOD'),
          SizedBox(
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                  FutureBuilder(
                 future: fetchFoods(),
                builder: (context,snapshot){
                 if(snapshot.hasData){
                return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true, 
                itemBuilder: (BuildContext context, int index) {
                  Foods foods = snapshot.data[index];
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
                        '${foods.foodImgUrl}',
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
                                child: Text('${foods.foodPuan}',
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
                    '${foods.foodTitle}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${foods.foodSubCat}',
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    )),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${foods.foodAdress}',
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    )),
              ],
            ),
          )
        ],
      ),
    );
                },
                );
                 }
                return CircularProgressIndicator();
                },
                 ),
              ],
            ),
          ),
          SizedBox(height: 10),
          /////////////////////////////////

          _sectionname(title: 'RESTURANT CAFE'),
          SizedBox(
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                FutureBuilder(
                 future: fetchFoods(),
                builder: (context,snapshot){
                 if(snapshot.hasData){
                return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true, 
                itemBuilder: (BuildContext context, int index) {
                  Foods foods = snapshot.data[index];
                return  Padding(
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
                        '${foods.foodImgUrl}',
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
                },
                );
                 }
                return CircularProgressIndicator();
                },
                 ),
                
              ],
            ),
          ),
          SizedBox(height: 10),
          /////////////////////////////////

          _sectionname(title: 'CASUAL DINING'),
          SizedBox(
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                
              ],
            ),
          ),
          /////////////////////////////////
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////

_sectionname({String title}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: TextStyle(color: Colors.grey[500])),
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

///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////

