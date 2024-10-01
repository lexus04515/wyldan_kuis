import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String? _nickname;
  String _password = "";
  bool isClicked = false;

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HomePage(username: _username, nickname: _nickname),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _header(),
            SizedBox(height: 20),
            _usernameField(),
            _nicknameField(),
            _passwordField(),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Image.asset(
          'images/logo.png', // gambar logo
          height: 100, // atur besar kecil logo
        ),
        SizedBox(height: 20), // spasi antara logo dan text
        Text(
          'Selamat Datang',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
      ],
    );
  }

  Widget _usernameField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          _username = value;
        },
        decoration: InputDecoration(
          hintText: 'Masukkan Username',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
      ),
    );
  }

  Widget _nicknameField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          _nickname = value;
        },
        decoration: InputDecoration(
          hintText: 'Masukkan Panggilan',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          _password = value;
        },
        decoration: InputDecoration(
          hintText: 'Masukkan Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple),
          foregroundColor: MaterialStateProperty.all(
              Colors.white), // atur text login menjadi putih
        ),
        onPressed: () {
          if (_username == "wyldan" && _password == "115") {
            _navigateToHome();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login Berhasil')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Username atau Password Salah')),
            );

            setState(() {
              isClicked = !isClicked;
              print(isClicked);
            });
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}
