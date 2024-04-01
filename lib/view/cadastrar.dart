// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {

  // Chave identificador Form
  var formkey = GlobalKey<FormState>();

  // Controlador textbox
  var txtlogon = TextEditingController();
  var txtsenha = TextEditingController();
  var txtemail = TextEditingController();
  var txtconfirmsenha = TextEditingController();

  // Ocultar - Mostrar senha

  bool _isObscure = true;

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

              // Logon textfield
              TextFormField(
                controller: txtlogon,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  prefixIcon
                  : Icon(Icons.account_circle),
                ),

                validator: (value){
                  if(value == null){
                    return 'Informe um usuário válido!';
                  }
                  else if(value.isEmpty){
                    return 'Informe um usuário válido';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              // Email textfield
              TextFormField(
                controller: txtemail,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),

                validator: (value){
                  if(value == null){
                    return 'Informe um email válido!';
                  }
                  else if(value.isEmpty){
                    return 'Informe um email válido';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              // Senha textfield
              TextFormField(
                controller: txtsenha,
                style: TextStyle(fontSize: 18),
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                ),

                validator: (value){
                  if(value == null){
                    return 'Insira sua senha!';
                  }
                  else if(value.isEmpty){
                    return 'Insira sua senha!';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              // Confirma Senha textfield

              TextFormField(
                controller: txtconfirmsenha,
                style: TextStyle(fontSize: 18),
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                ),

                validator: (value){
                  if(value == null){
                    return 'Insira sua senha!';
                  }
                  else if(value.isEmpty){
                    return 'Insira sua senha!';
                  }
                  else if(txtconfirmsenha.value != txtsenha.value){
                    return 'As senhas não coincidem!';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              // Logon button

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
                      'confirmar_conta',
                    );
                  }
                },
                
                child: Text('Cadastrar'),
              )

            ],
          ),
        )
      )
    );
  }
}
