// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TrocaSenha extends StatefulWidget {
  const TrocaSenha({super.key});

  @override
  State<TrocaSenha> createState() => _TrocaSenhaState();
}

class _TrocaSenhaState extends State<TrocaSenha> {
  
  var formkey = GlobalKey<FormState>();

  var txtnovasenha = TextEditingController();
  var txtconfirmanovasenha = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          }),
          
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
                  child: Text('Digite abaixo a nova senha que você deseja utilizar'),
                ),
              ),

              SizedBox(height: 30),
              
              TextFormField(
                controller: txtnovasenha,
                style: TextStyle(fontSize: 18),
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Nova senha',
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
                    return 'Insira o código no campo acima!';
                  }
                  else if(value.isEmpty){
                    return 'Insira o código no campo acima!';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30),

              TextFormField(
                controller: txtconfirmanovasenha,
                style: TextStyle(fontSize: 18),
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Confirmar nova senha',
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
                    return 'Insira sua nova senha!';
                  }
                  else if(value.isEmpty){
                    return 'Insira sua nova senha!';
                  }
                  else if(txtconfirmanovasenha.text != txtnovasenha.text){
                    return 'As senhas não coincidem!';
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