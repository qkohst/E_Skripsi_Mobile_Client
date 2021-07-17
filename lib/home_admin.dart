import 'package:e_skripsi/adminprodi_page.dart';
import 'package:e_skripsi/adminseminarproposal_page.dart';
import 'package:e_skripsi/adminsidangskripsi_page.dart';
import 'package:e_skripsi/fakultas_page.dart';
import 'package:e_skripsi/jabatanfungsional_page.dart';
import 'package:e_skripsi/jabatanstruktural_page.dart';
import 'package:e_skripsi/main.dart';
import 'package:e_skripsi/programstudi_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
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
            UserAccountsDrawerHeader(
                accountName: new Text("$nama"),
                accountEmail: new Text("$role"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.white,
                )),
            new ListTile(
              title: new Text('Home'),
              trailing: new Icon(Icons.home),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeAdmin();
              })),
            ),
            new ListTile(
              title: new Text('Fakultas'),
              trailing: new Icon(Icons.auto_awesome_mosaic),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Fakultas();
              })),
            ),
            new ListTile(
              title: new Text('Program Studi'),
              trailing: new Icon(Icons.auto_awesome_mosaic_outlined),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProgramStudi();
              })),
            ),
            new ListTile(
              title: new Text('Jabatan Fungsional'),
              trailing: new Icon(Icons.account_tree),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return JabatanFungsional();
              })),
            ),
            new ListTile(
              title: new Text('Jabatan Struktural'),
              trailing: new Icon(Icons.account_tree_outlined),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return JabatanStruktural();
              })),
            ),
            new ListTile(
              title: new Text('Admin Prodi'),
              trailing: new Icon(Icons.supervised_user_circle_sharp),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AdminProdi();
              })),
            ),
            new ListTile(
              title: new Text('Seminar Proposal'),
              trailing: new Icon(Icons.book),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AdminSeminarProposal();
              })),
            ),
            new ListTile(
              title: new Text('Sidang Skripsi'),
              trailing: new Icon(Icons.book_outlined),
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AdminSidangSkripsi();
              })),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Selamat Datang",
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
