class ListaCompra {
  final String nome;

  ListaCompra({required this.nome});

  static List<ListaCompra> preencher() {
    List<ListaCompra> lista = [];

    lista.add(ListaCompra(nome: 'Mercado Mensal'));
    lista.add(ListaCompra(nome: 'WishList'));

    return lista;
  }
}