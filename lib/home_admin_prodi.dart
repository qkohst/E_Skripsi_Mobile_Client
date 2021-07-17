import 'package:e_skripsi/adminprodiseminarproposal_page.dart';
import 'package:e_skripsi/adminprodisidangskripsi_page.dart';
import 'package:e_skripsi/dosen_page.dart';
import 'package:e_skripsi/mahasiswa_page.dart';
import 'package:e_skripsi/main.dart';
import 'package:e_skripsi/persetujuankrs_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAdminProdi extends StatefulWidget {
  @override
  _HomeAdminProdiState createState() => _HomeAdminProdiState();
}

class _HomeAdminProdiState extends State<HomeAdminProdi> {
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
                return HomeAdminProdi();
              })),
            ),
            new ListTile(
              title: new Text('Mahasiswa'),
              trailing: new Icon(Icons.supervised_user_circle_outlined),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Mahasiswa();
              })),
            ),
            new ListTile(
              title: new Text('Dosen'),
              trailing: new Icon(Icons.supervisor_account),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Dosen();
              })),
            ),
            new ListTile(
              title: new Text('Persetujuan KRS'),
              trailing: new Icon(Icons.fact_check_outlined),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PersetujuanKRS();
              })),
            ),
            new ListTile(
              title: new Text('Seminar Proposal'),
              trailing: new Icon(Icons.book),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AdminProdiSeminarProposal();
              })),
            ),
            new ListTile(
              title: new Text('Sidang Skripsi'),
              trailing: new Icon(Icons.book_outlined),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AdminProdiSidangSkripsi();
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
              Text('Anda Login Sebagai $role'),
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
