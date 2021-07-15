import 'package:e_skripsi/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _logOut,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Selamat Datang',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Pilih Tema'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Light'),
              Switch(
                value: _switch,
                onChanged: (val) {},
              ),
              Text('Dark'),
            ],
          )
        ],
      ),
    );
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLogin');
    prefs.remove('nama');
    prefs.remove('username');
    prefs.remove('role');
    prefs.remove('api_token');

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => MyApp()));
  }
}
