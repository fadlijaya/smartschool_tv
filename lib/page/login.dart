import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartschool_tv/page/home.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  var isLoading = false;

  @override
  void initState() {
    getPref();
    super.initState();
  }

  login() async {
    var url = Uri.parse('https://sekolahandalan.id/db_guru.php');
    final response = await http
        .post(url, body: {'email': _email.text, 'password': _password.text});
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      int value = data['value'];
      String pesan = data['message'];

      if (value == 1) {
        Map<String, dynamic> user = data['data'];
        // ignore: avoid_print
        print('Username ${user['id_guru']}');
        savePref(1, user['id_guru'], user['email'], user['nip'], user['nama_guru']);

        displaySnackBar(pesan);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const Home(
              
            ),
          ),
          (route) => false,
        );
      } else {
        displaySnackBar(pesan);
      }
    } else {
      throw Exception('Failed to load');
    }
  }

  savePref(int value, String id, String email, String nip, String nama) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt("value", value);
    await preferences.setString("id_guru", id);
    await preferences.setString("email", email);
    await preferences.setString("nip", nip);
    await preferences.setString("nama_guru", nama);
    // ignore: deprecated_member_use
    await preferences.commit();
  }

  // ignore: prefer_typing_uninitialized_variables
  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      value == 1
          ? WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const Home(
                
                  ),
                ),
                (route) => false,
              );
            })
          : const Login();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16),
            child: SafeArea(
              child: SingleChildScrollView(child: widgetForm()),
            )));
  }

  widgetForm() {
    final node = FocusScope.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            TextFormField(
              style: const TextStyle(color: Colors.black54),
              cursorColor: Colors.black54,
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Masukkan Email';
                } else if (!value.contains('@')) {
                  return 'Email Salah';
                }
              },
              onFieldSubmitted: (value) => node.nextFocus(),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.black54),
              cursorColor: Colors.black54,
              controller: _password,
              obscureText: true,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black54),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Masukkan Password';
                }
              },
              onFieldSubmitted: (value) => node.unfocus(),
            ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: () {
                if (!isLoading) {
                  if (_formKey.currentState!.validate()) {
                    displaySnackBar('Mohon Tunggu..');
                    login();
                  }
                }
              },
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  displaySnackBar(text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
