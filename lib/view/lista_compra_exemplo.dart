// ignore_for_file: prefer_const_constructors, overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/inside_list.dart';

class ListaExemplo extends StatefulWidget {
  final String? nomeLista;
  final Key? key;

  const ListaExemplo({this.nomeLista, this.key}) : super(key: key);

  @override
  State<ListaExemplo> createState() => _ListaExemploState();
}

class _ListaExemploState extends State<ListaExemplo> {

  var formkey = GlobalKey<FormState>();

  var txtitem = TextEditingController();
 
  List<ListInside> dados = [];

  @override
  void initState(){
    dados = ListInside.preencher();
    super.initState();
    txtitem = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context);
          }),
          
        title: Row(
          children: [
            Image.asset(
              'lib/imagens/carrinho.png',
              width: 40,
              height: 40,
            ),
            SizedBox(width: 8),
            Text(widget.nomeLista ?? ''),
          ],
        ),
        automaticallyImplyLeading: false,
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
                      leading: Icon(Icons.fastfood_rounded),
                      title: Text(dados[index].item),
                      trailing: Checkbox(
                        value: dados[index].isChecked,
                        onChanged: (value){
                          setState(() {
                            dados[index].isChecked = value!;
                          });
                        },
                      ),
                      onTap: () {
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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade100,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
	            title: const Text('Adicionar item'),
              content: Form(
                key: formkey,
                  child: TextFormField(
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
                        dados.add(ListInside(item:txtitem.text));
                      });
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