import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartschool_tv/page/account.dart';
import 'package:smartschool_tv/page/live_stream.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Live Meeting';
  String? idGuru;
  String? namaGuru;
  String? emailGuru;
  String? nipGuru;

  getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      idGuru = preferences.getString('id_guru');
      namaGuru = preferences.getString('nama_guru');
      emailGuru = preferences.getString('email');
      nipGuru = preferences.getString('nip');
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Account())),
                icon: const Icon(Icons.account_circle_rounded)),
          ],
        ),
        body: const LiveStream());
  }
}
