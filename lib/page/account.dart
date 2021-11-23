import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartschool_tv/page/login.dart';

class Account extends StatefulWidget {
  const Account({
    Key? key,
  }) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String? idGuru;
  String? namaGuru;
  String? emailGuru;
  String? nipGuru;

  _getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      idGuru = preferences.getString("id_guru");
      namaGuru = preferences.getString("nama_guru");
      emailGuru = preferences.getString("email");
      nipGuru = preferences.getString("nip");
    });
  }

  @override
  void initState() {
    super.initState();
    _getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      child: Stack(
        children: [widgetHeader(), widgetBody()],
      ),
    ));
  }

  widgetHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue,
      height: 200.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
                iconSize: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Icon(Icons.account_circle_rounded,
              size: 70.0, color: Colors.white),
          Text(
            "$namaGuru",
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: Colors.white),
          ),
        ],
      ),
    );
  }

  widgetBody() {
    return Container(
      margin: const EdgeInsets.only(top: 200.0),
      child: Column(
        children: [
          Card(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('NIP',
                      style: TextStyle(color: Colors.black54, fontSize: 12)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text("$nipGuru")
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email',
                      style: TextStyle(color: Colors.black54, fontSize: 12)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text("$emailGuru")
                ],
              ),
            ),
          ),
          Card(
            child: GestureDetector(
              onTap: () {
                showAlertExit(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.exit_to_app,
                      size: 16,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    const Text(
                      "Keluar",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showAlertExit(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi'),
            content: const Text('Anda yakin ingin Keluar ?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Batal',
                    style: TextStyle(color: Colors.grey),
                  )),
              TextButton(
                  onPressed: () {
                    signOut();
                  },
                  child: const Text('Ya'))
            ],
          );
        });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", 0);
      preferences.clear();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false);
    });
  }
}
