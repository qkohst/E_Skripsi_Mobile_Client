import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:e_skripsi/main.dart';
import './jabatanstruktural_model.dart';

class JabatanStruktural extends StatefulWidget {
  @override
  _JabatanStrukturalState createState() => new _JabatanStrukturalState();
}

class _JabatanStrukturalState extends State<JabatanStruktural> {
  late List<JabatanStrukturalModel> listjabatanstruktural;
  @override
  void initState() {
    super.initState();
  }

  Future<List<JabatanStrukturalModel>> _fetchData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var _apiToken = prefs.getString('api_token');
      var jsonResponse = await http.get(
          Uri.parse(
              'http://192.168.43.71:8000/api/v1/admin/jabatanstruktural?api_key=4pyHNMVxTnNVpe571jMMXtE0a5X74PDYqkoLRds9lXlSqOW7GtqrBT29ptY5'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $_apiToken'
          });
      if (jsonResponse.statusCode == 200) {
        final jsonItems =
            json.decode(jsonResponse.body)['data'].cast<Map<String, dynamic>>();

        listjabatanstruktural = jsonItems.map<JabatanStrukturalModel>((json) {
          return JabatanStrukturalModel.fromJson(json);
        }).toList();
      }
    } catch (e) {}
    return listjabatanstruktural;
  }

  Future<Null> _refresh() {
    return _fetchData().then((_listjabatanstruktural) {
      setState(() => listjabatanstruktural = _listjabatanstruktural);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Data Jabatan Struktural'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: _logOut,
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: FutureBuilder<List<JabatanStrukturalModel>>(
            future: _fetchData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              return Container(
                margin: EdgeInsets.only(bottom: 0.0),
                child: ListView(
                  padding: EdgeInsets.only(bottom: 160.0),
                  children: snapshot.data!
                      .map(
                        (_data) => Column(children: <Widget>[
                          Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Text(_data.nama),
                                  subtitle:
                                      Text("Deskripsi : " + _data.deskripsi),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      )
                      .toList(),
                ),
              );
            },
          ),
        ));
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => MyApp()));
  }
}
