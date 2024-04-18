// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers, override_on_non_overriding_member

import 'package:flutter/material.dart';
import '../model/listas.dart';
import 'package:flutter_application_1/view/lista_compra_exemplo.dart';
 
class MainView extends StatefulWidget {
  const MainView({super.key});
 
  @override
  State<MainView> createState() => _MainViewState();
}
 
class _MainViewState extends State<MainView> {
 
  var formkey = GlobalKey<FormState>();

  var txtlista = TextEditingController();

  List<ListaCompra> dados = [];

  @override
  void initState(){
    dados = ListaCompra.preencher();
    super.initState();
    txtlista = TextEditingController();
  }
  
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
          width: 40,
          height: 40,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: dados.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.shopping_bag),
                      title: Text(dados[index].nome),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListaExemplo(nomeLista: dados[index].nome),
                          ),
                        );

                      },
                      hoverColor: Colors.red.shade100,
                      onLongPress: () {
                        setState(() {
                          dados.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      //
      // FloatActionButton!!!!!!!!!!!
      //

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue.shade100,
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Criar lista'),
                  content: Form(
                    key: formkey, // Adicionado o formkey aqui
                    child: TextFormField(
                      controller: txtlista,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Nome da lista'
                      ),
                      validator: (value){
                        if(value == null){
                          return 'Insira o nome da lista';
                        }
                        else if(value.isEmpty){
                          return 'Insira o nome da lista';
                        }
                        return null;
                      },
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancelar'),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: (){
                        if(formkey.currentState!.validate()){
                          setState(() {
                            dados.add(ListaCompra(nome: txtlista.text));
                          });
                          Navigator.pop(context, 'Criar');
                        }
                      },
                      child: const Text('Criar'),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(width: 100),
          
          FloatingActionButton(
            backgroundColor: Colors.blue.shade100,
            child: Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('About Us / Sobre Nós'),
                  content: Text('This is a flutter project called "Buy List" that you can create lists and inside of this lists, you can add itens that you want to buy, '
                    'and you can also mark then as already bought.\nThis project was made for improve my flutter prototype knowledge.\n\n'
                    'Esse é um projeto em flutter chamado "Buy List" (Lista de compra) onde você consegue criar listas e dentro dessas listas, você consegue '
                    'adicionar itens que você deseja comprar, e você também pode marcar os itens como já comprados.\nEsse projeto foi feito com a intenção de melhorar '
                    'o meu conhecimento sobre prototipos em flutter.\n\n'
                    'Vinícius Kenzo Hiraoka'),
                )
              );
            }
          )
        ],
      )  
    );
  }
}
