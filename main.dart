import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override            
  Widget build(BuildContext context) {  
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Inokashira Park',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  'Musashino-shi, Tokyo, Japan',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Counter(),
        ],
      ),
    );

/*    Widget imageSection = Image.asset(
      'lib/images/1.jpg',
      width: 600 ,
      height: 240,
      fit: BoxFit.cover,
    );
*/
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Cherry blossoms (Sakura - '
          'katakana: サ ク ラ, hiragana: さ く ら, kanji: 桜' 
          '(former Chinese characters: 櫻 Pinyin: English))'
          'are flowers of plants of the genus Cherry, Plum,' 
          'Rose family; especially for Prunus serrulata and some others for ornamental purposes.' 
          'As for cherries, most of them are hybrids of Prunus avium and Prunus cerasus.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,            
      title: 'Hoa Anh Đào( Sakura )',            
      home: Scaffold(            
        appBar: AppBar(            
        title: Text('Hoa Anh Đào( Sakura )'),            
      ),            
      body: ListView(           
        children: [
          Image.asset(
            'lib/images/hoa.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),

      drawer: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    'lib/images/1.jpg'),
                    radius: 100,
                ),
                    accountName: Text(
                      'Lương Ngọc',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ), 
                    ),
                    accountEmail: Text(
                      'luongngoc1998chtq@gmail.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ), 
                    ),
                    otherAccountsPictures: <Widget>[
                      Icon(
                        Icons.add_alert,
                        color: Colors.red[200],
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[500],
                      ),
                    ],
                    onDetailsPressed: () {},
                  
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(top: 8.0),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.home
                          ),
                          title: Text('Trang chủ'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.settings
                          ),
                          title: Text('Cài đặt'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.hotel
                          ),
                          title: Text('Khách sạn'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.local_taxi
                          ),
                          title: Text('Xe cộ'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.local_dining
                          ),
                          title: Text('Nhà hàng'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.phone
                          ),
                          title: Text('Hotline'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.email
                          ),
                          title: Text('Email phản hồi'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.rate_review
                          ),
                          title: Text('Đánh giá'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.lock
                          ),
                          title: Text('Đăng xuất'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class Counter extends StatefulWidget{
  @override
  _CounterState createState() => _CounterState();
}
class _CounterState extends State<Counter> {
  int _counter =0;
  void _increment(){
    setState(() {
      _counter ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.favorite,
            color: Colors.red[500],
          ),
          onPressed: _increment,
        ),
        Text('$_counter'),
      ],
    );
  }
}