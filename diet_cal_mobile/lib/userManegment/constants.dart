import 'package:flutter/material.dart';

class LoginLiterals {
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
}

class ForgotPasswordLiterals {
  static const String mailInputHintText = 'Coloque su correo';
  static const String mailInputLabel = 'Correo';
  static const Icon mailInputIcon = Icon(Icons.mail);
  static const String forgotPassword = LoginLiterals.forgotPassword;
  static const String forgotPasswordNextStep =
      "Se le enviara un correo indicando los siguientes pasos para cambiar su contraseña";
  static const String mailNotFound = "Este correo no esta registrado";
  static const String resetPassword = "Restablecer contraseña";
  static const String register = "Crear usuario";
  static const String mandatoryMail = "Es obligatorio colocar un correo";
}
