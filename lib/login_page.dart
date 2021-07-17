import 'package:e_skripsi/home_admin.dart';
import 'package:e_skripsi/home_admin_prodi.dart';
import 'package:e_skripsi/home_dosen.dart';
import 'package:e_skripsi/home_mahasiswa.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? Center(
                child: Text('Harap Tunggu ...'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      'E-Skripsi Unirow Tuban',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: txtUsername,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: txtPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Container(
                      height: 70,
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('LOGIN'),
                        onPressed: () {
                          this._postLogin();
                        },
                      )),
                ],
              ));
  }

  Future _postLogin() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Alert(
              context: context,
              title: "Masukkan Username dan Password",
              type: AlertType.warning)
          .show();
      return;
    }

    final response = await http
        .post(Uri.parse('http://192.168.43.71:8000/api/v1/auth/login'), body: {
      'api_key': '4pyHNMVxTnNVpe571jMMXtE0a5X74PDYqkoLRds9lXlSqOW7GtqrBT29ptY5',
      'username': txtUsername.text,
      'password': txtPassword.text,
    }, headers: {
      'Accept': 'application/json'
    });

    setState(() {
      _isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();

    Future.delayed(Duration(seconds: 2), () async {
      if (response.statusCode == 200) {
        var res = json.decode(response.body);
        prefs.setBool('isLogin', true);
        prefs.setString('nama', res['data']['nama']);
        prefs.setString('username', res['data']['username']);
        prefs.setString('role', res['data']['role']);
        prefs.setString('api_token', res['data']['api_token']);
        
        if (prefs.getString('role') == 'Admin') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => HomeAdmin()));
        } else if (prefs.getString('role') == 'Admin Prodi') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => HomeAdminProdi()));
        } else if (prefs.getString('role') == 'Mahasiswa') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => HomeMahasiswa()));
        } else if (prefs.getString('role') == 'Dosen') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) => HomeDosen()));
        }
      } else {
        setState(() {
          _isLoading = false;
        });

        Alert(
                context: context,
                title: "Username atau Password Salah",
                type: AlertType.error)
            .show();
      }
    });
  }
}
