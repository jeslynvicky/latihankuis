import 'package:flutter/material.dart';
import 'package:pertemuan2/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _nickname = TextEditingController();
  final _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String? _errorMessage;

  @override
  void dispose() {
    _username.dispose();
    _nickname.dispose();
    _password.dispose();
    super.dispose();
  }

  void _login() {
    setState(() {
      _errorMessage = null;
    });

    if (_formkey.currentState!.validate()) {
      String username = _username.text.trim();
      String password = _password.text.trim();

      if (username == "admin" && password == "123") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Berhasil')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              username: username,
              nickname: _nickname.text.trim(),
            ),
          ),
        );
      } else if (username != "admin" && password == "123") {
        setState(() {
          _errorMessage = "Username salah!";
        });
      } else if (username == "admin" && password != "123") {
        setState(() {
          _errorMessage = "Password salah!";
        });
      } else {
        setState(() {
          _errorMessage = "Username dan password salah!";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5DC), // Beige background
        appBar: AppBar(
          title: const Center(
            child: Text('Login Page', style: TextStyle(color: Colors.white)),
          ),
          backgroundColor: const Color(0xFF001F3F), // Navy AppBar
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Form(
          key: _formkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future:
                        precacheImage(AssetImage('assets/image/cinamoroll.gif'), context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Image.asset('assets/image/cinamoroll.gif',
                            height: 150, width: 150, gaplessPlayback: true);
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 35, color: Color(0xFF001F3F)),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF87CEEB)),
                      ),
                      labelText: "Username",
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Username tidak boleh kosong!" : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _nickname,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF87CEEB)),
                      ),
                      labelText: "Nama Panggilan (Opsional)",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF87CEEB)),
                      ),
                      labelText: "Password",
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Password tidak boleh kosong!" : null,
                  ),
                  if (_errorMessage != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF001F3F),
                      foregroundColor: const Color(0xFFF5F5DC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}