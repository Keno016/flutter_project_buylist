class ListInside {

  final String item;

  ListInside(this.item);

  static List<ListInside> preencher() {
    List<ListInside> lista = [];

    lista.add(ListInside('Banana'));
    lista.add(ListInside('Maça'));
    lista.add(ListInside('Laranja'));
    lista.add(ListInside('Danone'));
    lista.add(ListInside('Cebola'));
    lista.add(ListInside('Alface'));
    
    return lista;
  }
}