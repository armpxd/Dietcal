import 'package:flutter/material.dart';
import '../appConstants.dart';

class LoginConstants {
  static const String userInputHintText = 'Coloque su nombre de usuario';
  static const String userInputLabel = 'Usuario';
  static const Icon userInputIcon = Icon(Icons.person);

  static const String passwordInputHintText = 'Coloque su contraseña';
  static const String passwordInputLabel = 'Contraseña';
  static const Icon passwordInputIcon = Icon(Icons.lock);

  static const String passwordRememberMe = "Recordar contraseña";

  static const String login = "Iniciar Sección";

  static const String forgotPassword = "¿Olvidaste tu contraseña?";
  static const String mandatoryField = "Este campo es obligatorio";
  static const String register = "Crear usuario";

  static const Color switchActiveTrackColor = Color(0xff5ACD87);
  static const Color switchInactiveThumbColor = mainColorLight;
  static const Color buttonGradientRightColor = Color(0xff50DF82);
  static const Color buttonGradientLeftColor = mainColorLight;
  static const Color buttonForgotPasswordColor = mainColorStrong;
}

class ForgotPasswordConstants {
  static const String mailInputHintText = 'Coloque su correo';
  static const String mailInputLabel = 'Correo';
  static const Icon mailInputIcon = Icon(Icons.mail);
  static const String forgotPassword = LoginConstants.forgotPassword;
  static const String forgotPasswordNextStep =
      "Se le enviara un correo indicando los siguientes pasos para cambiar su contraseña";
  static const String mailNotFound = "Este correo no esta registrado";
  static const String resetPassword = "Restablecer contraseña";
  static const String register = LoginConstants.register;
  static const String mandatoryMail = "Es obligatorio colocar un correo";
}
