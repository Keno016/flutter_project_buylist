// ignore_for_file: prefer_const_constructors

import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/inside_list.dart';

class ListaExemplo extends StatefulWidget {
  const ListaExemplo({super.key});

  @override
  State<ListaExemplo> createState() => _ListaExemploState();
}

class _ListaExemploState extends State<ListaExemplo> {

  var formkey = GlobalKey<FormState>();

  var txtitem = TextEditingController();
 
  List<ListInside> dados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'lib/imagens/carrinho.png',
          width: 40,
          height: 40,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),

        child: ListView.builder(
          // Quantidade de listas de compra
          itemCount: dados.length,
          
          // Aparencia das listas
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.fastfood_outlined),

                title: Text(dados[index].item),

                onTap: (){
                  Navigator.pushNamed(
                      context,
                      'lista_exemplo',
                    );
                },
                hoverColor: Colors.red.shade100,

                onLongPress: (){
                  setState(() {
                    dados.removeAt(index);
                  });
                },
              )
            );
          }
        ),
      ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade100,
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
	              title: const Text('Adicionar item'),
                content: TextFormField(
                  controller: txtitem,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Nome do item'
                  ),
                
                  validator: (value){
                    if(value == null){
                      return 'Insira o nome do item';
                    }
                    else if(value.isEmpty){
                      return 'Insira o nome do item';
                    }
                    return null;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancelar'),
                    child: const Text('Cancelar'),
                  ),
                  
                  TextButton(
                    onPressed: (){
                      if(formkey.currentState!.validate()){
                        Navigator.pop(
                          context,
                          'Adicionar'
                        );
                      }
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            );
          },
        ),
        
      );
  }
}