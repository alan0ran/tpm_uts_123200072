import 'package:flutter/material.dart';
import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: FlutterLogo(),
              ),
              _usernameField(),
              _passwordField(),
              _loginButton()
            ]),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(20.0),
          border: const OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
            const BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: (isLoginSuccess)
                ? Colors.deepPurple : Colors.red),
          ),
        ),
      ),
    );
  }
  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(20.0),
          border: const OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
            const BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: (isLoginSuccess)
                ? Colors.deepPurple : Colors.red),
          ),
        ),
      ),
    );
  }
  Widget _loginButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: (isLoginSuccess) ? Colors.deepPurple : Colors.red, // foreground
        ),
        onPressed: () {
          String text = "";
          if (username == "123200072" && password ==
              "alan") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Dashboard()));
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }

}