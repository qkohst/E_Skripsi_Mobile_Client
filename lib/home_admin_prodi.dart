import 'package:e_skripsi/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAdminProdi extends StatefulWidget {
  @override
  _HomeAdminProdiState createState() => _HomeAdminProdiState();
}

class _HomeAdminProdiState extends State<HomeAdminProdi> {
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
      drawer: new Drawer(
        child: new ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Kukoh Santoso"),
                accountEmail: new Text("Admin Prodi"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            new ListTile(
              title: new Text('Profile'),
              trailing: new Icon(Icons.account_circle),
              onTap: () => Navigator.of(context).pop(),
            ),
            new ListTile(
              title: new Text('Home'),
              trailing: new Icon(Icons.home),
              onTap: () => Navigator.of(context).pop(),
            ),
            new ListTile(
              title: new Text('Mahasiswa'),
              onTap: () => Navigator.of(context).pop(),
              trailing: new Icon(Icons.supervised_user_circle_outlined),
            ),
            new ListTile(
              title: new Text('Dosen'),
              trailing: new Icon(Icons.supervisor_account),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Selamat Datang',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Kukoh Santoso',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Anda Login Sebagai Admin Admin Prodi'),
            ],
          )
        ],
      ),
    );
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => MyApp()));
  }
}
