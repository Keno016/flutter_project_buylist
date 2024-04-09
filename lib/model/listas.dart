class ListaCompra {

  final String nome;

  ListaCompra(this.nome);

  static List<ListaCompra> preencher() {
    List<ListaCompra> lista = [];

    lista.add(ListaCompra('Mercado Mensal'));
    lista.add(ListaCompra('WishList'));

    return lista;
  }
}