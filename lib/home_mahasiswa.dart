import 'package:e_skripsi/mahasiswabimbinganproposal_page.dart';
import 'package:e_skripsi/mahasiswabimbinganskripsi_page.dart';
import 'package:e_skripsi/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeMahasiswa extends StatefulWidget {
  @override
  _HomeMahasiswaState createState() => _HomeMahasiswaState();
}

class _HomeMahasiswaState extends State<HomeMahasiswa> {
  String nama = "";
  String role = "";
  String apiToken = "";

  @override
  Widget build(BuildContext context) {
    _getFromSharedPreferences();
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
            new SizedBox(
              height: 100.0,
              child: new UserAccountsDrawerHeader(
                accountName: new Text("$nama",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                accountEmail: new Text("$role"),
                margin: EdgeInsets.zero,
              ),
            ),
            new ListTile(
              title: new Text('Home'),
              trailing: new Icon(Icons.home),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeMahasiswa();
              })),
            ),
            new ListTile(
              title: new Text('Bimbingan Proposal'),
              trailing: new Icon(Icons.book),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MahasiswaBimbinganProposal();
              })),
            ),
            new ListTile(
              title: new Text('Bimbingan Skripsi'),
              trailing: new Icon(Icons.book_outlined),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MahasiswaBimbinganSkripsi();
              })),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Selamat Datang',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "$nama",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Anda Login Sebagai $role"),
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

  void _getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      nama = prefs.getString("nama") ?? "No Name";
      role = prefs.getString("role") ?? "No Role";
      apiToken = prefs.getString("api_token") ?? "No Token";
    });
  }
}
