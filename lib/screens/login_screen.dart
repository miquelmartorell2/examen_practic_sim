import 'package:flutter/material.dart';
import '../preferences/preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false; // Initialize _rememberMe as false

  @override
  void initState() {
    super.initState();
    // Initialize shared preferences to prevent null errors
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    await Preferences.init();
    _rememberMe = Preferences.rememberMe;// Pre-fill checkbox state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                Text('Remember me'),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                if (_rememberMe) {
                  // Store username and password in shared preferences
                  Preferences.username = username;
                  Preferences.password = password;
                  Preferences.rememberMe = _rememberMe;
                  print('sotored');
                } else {
                  // Clear shared preferences if not remembered
                  print('nostoret');
                  await Preferences.clear();
                }

                Navigator.of(context).pushNamed('home');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}