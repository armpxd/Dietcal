import 'package:flutter/material.dart';
import 'constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginForm = GlobalKey<FormState>();
  bool _rememberMeState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Diet',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      'cal',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                child: Form(
                  key: _loginForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, top: 40, left: 10, right: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              icon: LoginLiterals.userInputIcon,
                              hintText: LoginLiterals.userInputHintText,
                              labelText: LoginLiterals.userInputLabel,
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 30, left: 10, right: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              icon: LoginLiterals.passwordInputIcon,
                              hintText: LoginLiterals.passwordInputHintText,
                              labelText: LoginLiterals.passwordInputLabel,
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(LoginLiterals.passwordRememberMe),
                          Switch(
                            activeTrackColor: Color(0xff5ACD87),
                            inactiveThumbColor: Color(0xff68EB9D),
                            activeColor: Colors.white,
                            value: _rememberMeState,
                            onChanged: (bool valueChange) {
                              setState(() {
                                _rememberMeState = valueChange;
                              });
                            },
                          ),
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Container(
                            height: 50.0,
                            child: RaisedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_loginForm.currentState.validate()) {
                                  // Process data.
                                } else {}
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff68EB9D),
                                        Color(0xff50DF82)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 300.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    LoginLiterals.login,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    LoginLiterals.forgotPassword,
                    style: TextStyle(
                        color: Color(0xff5ACD87),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
