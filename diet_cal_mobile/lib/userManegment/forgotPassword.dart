import 'package:flutter/material.dart';
import 'constants.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = "ForgotPassword";
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _forgotPasswordForm = GlobalKey<FormState>();
  bool _forgotPasswordFormState = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ForgotPasswordConstants.appBarTitle),
        backgroundColor: Color(0xff5ACD87),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 90),
                child: Icon(
                  Icons.lock,
                  color: Color(0xff5ACD87),
                  size: 100,
                ),
              ),
              Text(
                ForgotPasswordConstants.forgotPassword,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                ForgotPasswordConstants.forgotPasswordNextStep,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Visibility(
                visible: _forgotPasswordFormState,
                child: Container(
                  child: Form(
                    key: _forgotPasswordForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, top: 90, left: 10, right: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                icon: ForgotPasswordConstants.mailInputIcon,
                                hintText:
                                    ForgotPasswordConstants.mailInputHintText,
                                labelText:
                                    ForgotPasswordConstants.mailInputLabel,
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value.isEmpty ||
                                  !value.contains(".") ||
                                  !value.contains("@")) {
                                return ForgotPasswordConstants.mandatoryMail;
                              }
                              return null;
                            },
                          ),
                        ),
                        Visibility(
                          visible: false,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              ForgotPasswordConstants.mailNotFound,
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
                                  if (_forgotPasswordForm.currentState
                                      .validate()) {
                                    setState(() {
                                      _forgotPasswordFormState = false;
                                    });
                                    //validate if the mail is the correct one
                                  }
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
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 300.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      ForgotPasswordConstants.resetPassword,
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
              ),
              Expanded(
                child: Visibility(
                  visible: !_forgotPasswordFormState,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.done,
                        size: 100,
                        color: ForgotPasswordConstants.doneIconColor,
                      ),
                      Text(
                        ForgotPasswordConstants.emailSend,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 120),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                ForgotPasswordConstants.notUser,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              FlatButton(
                child: Text(
                  ForgotPasswordConstants.register,
                  style: TextStyle(
                      color: Color(0xff5ACD87),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )),
    );
  }
}
