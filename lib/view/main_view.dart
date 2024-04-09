// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers, override_on_non_overriding_member

import 'package:flutter/material.dart';
import '../model/listas.dart';
 
class MainView extends StatefulWidget {
  const MainView({super.key});
 
  @override
  State<MainView> createState() => _MainViewState();
}
 
class _MainViewState extends State<MainView> {
 
  var formkey = GlobalKey<FormState>();

  List<ListaCompra> dados = [];

  @override
  void initstate(){
    dados = ListaCompra.preencher();
    super.initState();
  }
  
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
                leading: Icon(Icons.shopping_bag),

                title: Text(dados[index].nome),

                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(dados[index].nome))
                  );
                },
                hoverColor: Colors.red.shade100,
              )
            );
          }
        ),

      ),
        // floating action button needs to be in the Scaffold widget
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue.shade100,
          child: Icon(Icons.add),
          onPressed: () {},
        ),

    );
  }
}




/*

      ListView.builder(
              itemCount: dados.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(

                    title: Text(dados[index].nome),

                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(dados[index].nome))    
                      );
                    },
                  ),
                );
              },
            ),
*/