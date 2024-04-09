class ListInside {
  final String item;
  bool isChecked;

  ListInside({required this.item, this.isChecked = false});

  static List<ListInside> preencher() {
    List<ListInside> lista = [];

    lista.add(ListInside(item: 'Banana'));
    lista.add(ListInside(item: 'Maça'));
    lista.add(ListInside(item: 'Laranja'));
    lista.add(ListInside(item: 'Danone'));
    lista.add(ListInside(item: 'Cebola'));
    lista.add(ListInside(item: 'Alface'));
    lista.add(ListInside(item: 'item'));
    
    return lista;
  }
}