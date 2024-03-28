// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/cadastrar.dart';
import 'package:flutter_application_1/view/esqueceu_senha.dart';
 
import 'view/login_view.dart';
import 'view/main_view.dart';
 
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}
 
class MainApp extends StatelessWidget {
  const MainApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginView(),
        'main_view': (context) => MainView(),
        'esqueceu_senha': (context) => EsqueceuSenha(),
        'cadastrar': (context) => Cadastrar(),
      },
    );
  }
}
