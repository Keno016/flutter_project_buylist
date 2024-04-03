// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class EsqueceuSenha extends StatefulWidget {
  const EsqueceuSenha({super.key});

  @override
  State<EsqueceuSenha> createState() => _EsqueceuSenhaState();
}

class _EsqueceuSenhaState extends State<EsqueceuSenha> {
  
  var formkey = GlobalKey<FormState>();

  var txtemail = TextEditingController();

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
                  child: Text('Insira seu email cadastrado no campo abaixo, para enviarmos uma solicitação de troca de senha.'),
                ),
              ),

              SizedBox(height: 30),

              TextFormField(
                controller: txtemail,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),

                validator: (value){
                  if(value == null){
                    return 'Insira seu email!';
                  }
                  else if(value.isEmpty){
                    return 'Insira seu email!';
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
                      'troca_senha',
                    );
                  }
                },
                
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      )
    );
  }
}