import 'package:e_skripsi/home_admin.dart';
import 'package:e_skripsi/home_admin_prodi.dart';
import 'package:e_skripsi/home_dosen.dart';
import 'package:e_skripsi/home_mahasiswa.dart';
import 'package:e_skripsi/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _loginCheck();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Skripsi',
      home: Splash(isLogin),
    );
  }

  void _loginCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isLogin') != null) {
      setState(() {
        isLogin = true;
      });
    }
  }
}

class Splash extends StatefulWidget {
  final bool isLogin;
  Splash(this.isLogin);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString('role') == 'Admin') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (c) => widget.isLogin ? HomeAdmin() : LoginPage()));
      } else if (prefs.getString('role') == 'Admin Prodi') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (c) =>
                    widget.isLogin ? HomeAdminProdi() : LoginPage()));
      } else if (prefs.getString('role') == 'Mahasiswa') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (c) =>
                    widget.isLogin ? HomeMahasiswa() : LoginPage()));
      } else if (prefs.getString('role') == 'Dosen') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (c) => widget.isLogin ? HomeDosen() : LoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Memuat Aplikasi ...'),
      ),
    );
  }
}
