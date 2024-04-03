// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ConfirmaConta extends StatefulWidget {
  const ConfirmaConta({super.key});

  @override
  State<ConfirmaConta> createState() => _ConfirmaContaState();
}

class _ConfirmaContaState extends State<ConfirmaConta> {
  
  var formkey = GlobalKey<FormState>();

  var txtcodigo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'lib/imagens/carrinho.png',
          width: 30,
          height: 30,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Para confirmar a criação da sua conta, insira o código que foi mandado para o seu email de cadastro no campo abaixo'),
                ),
              ),

              SizedBox(height: 30),
              
              TextFormField(
                controller: txtcodigo,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Código',
                ),

                validator: (value){
                  if(value == null){
                    return 'Insira o código no campo acima!';
                  }
                  else if(value.isEmpty){
                    return 'Insira o código no campo acima!';
                  }
                  else if(double.tryParse(value) == null){
                    return 'Insira um valor válido!';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                  foregroundColor: Colors.green.shade900,
                  minimumSize: Size(200, 50),
                  shadowColor: Colors.red,
                ),
                onPressed: (){
                  if(formkey.currentState!.validate()){
                    Navigator.pushNamed(
                      context,
                      'main_view',
                    );
                  }
                },

                child: Text('Confirmar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}