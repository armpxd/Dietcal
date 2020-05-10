import 'package:flutter/material.dart';
import 'constants.dart';
import 'forgotPassword.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginForm = GlobalKey<FormState>();
  bool _rememberMeState = false;
  bool _loginFormValidationState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //logic to verificate if the user have and token
    //See how to manage local storage in flutter to put the token id there and consult when is necesary
  }

  Widget flatCustomButton(action, text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FlatButton(
          onPressed: () {
            action();
          },
          child: Text(
            text,
            style: flatButtonTextStyle,
          ),
        ),
      ),
    );
  }

//LoginConstants.register
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 100),
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
                            bottom: 15, top: 90, left: 10, right: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              icon: LoginConstants.userInputIcon,
                              hintText: LoginConstants.userInputHintText,
                              labelText: LoginConstants.userInputLabel,
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value.isEmpty) {
                              return LoginConstants.mandatoryField;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 10, right: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              icon: LoginConstants.passwordInputIcon,
                              hintText: LoginConstants.passwordInputHintText,
                              labelText: LoginConstants.passwordInputLabel,
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value.isEmpty) {
                              return LoginConstants.mandatoryField;
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            LoginConstants.passwordRememberMe,
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Switch(
                            activeTrackColor:
                                LoginConstants.switchActiveTrackColor,
                            inactiveThumbColor:
                                LoginConstants.switchInactiveThumbColor,
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
                      Visibility(
                        visible: false,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            "Usuario o contraseña incorrecta",
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 16),
                          ),
                        )),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 35.0),
                          child: Container(
                            height: 50.0,
                            child: RaisedButton(
                              onPressed: () {
                                if (_loginForm.currentState.validate()) {
                                  //User login service call
                                  //servicio de login deberia tener un flag para el remenber me y asi verificar
                                  // si este es true para generar un token
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        LoginConstants.buttonGradientLeftColor,
                                        LoginConstants.buttonGradientRightColor,
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
                                    LoginConstants.login,
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
              flatCustomButton(
                  () => Navigator.pushNamed(context, ForgotPassword.id),
                  LoginConstants.forgotPassword),
              flatCustomButton(() => print("register"), LoginConstants.register)
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
