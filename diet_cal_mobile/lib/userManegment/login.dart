import 'package:flutter/material.dart';
import 'constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginForm = GlobalKey<FormState>();
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
                              return LoginLiterals.userInputValidator;
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
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Recordar Contraseña"),
                          Switch(
                            value: true,
                            onChanged: (bool valueChange) {},
                          ),
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: RaisedButton(
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_loginForm.currentState.validate()) {
                                // Process data.
                              }
                            },
                            child: Text('Iniciar Sección'),
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
                  child: Text("¿Olvidaste tu contraseña?"),
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
