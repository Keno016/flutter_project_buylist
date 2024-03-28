import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {

  // Identificador Form
  var formkey = GlobalKey<FormState>();

  // Controlador textbox
  var txtlogon = TextEditingController();
  var txtsenha = TextEditingController();

  //Ocultar - Mostrar senha

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Row(
                children: [

                  // Imagem

                  
                  Image.asset(
                    'lib/imagens/carrinho.png',
                    width: 50,
                    height: 50,
                  ),
                ],

              )          

            ],
          ),
        ),)
    );
  }
}