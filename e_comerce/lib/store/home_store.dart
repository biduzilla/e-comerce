import 'package:e_comerce/models/produto_1.dart';
import 'package:e_comerce/models/produto_2.dart';
import 'package:e_comerce/models/produto_geral.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  String categoria = "";

  @observable
  String inputPesquisa = "";

  @observable
  List<Produto1> p1 = [];
  @observable
  List<Produto2> p2 = [];

  @observable
  bool listaCarregada = false;

  // @observable
  // List<ProdutoGeral> produtos = [];

  ObservableList<ProdutoGeral> produtos = ObservableList();

  ObservableList<String> categorias = ObservableList();

  @action
  void setCategoria(String value) => categoria = value;

  @action
  void setInputPesquisa(String value) => inputPesquisa = value;

  @action
  void setP1(List<Produto1> lst) {
    p1 = lst;
  }

  @action
  void setP2(List<Produto2> lst) {
    p2 = lst;
  }

  @action
  void popularProdutos() {
    p1.forEach((produto) {
      ProdutoGeral pro = ProdutoGeral();
      pro.nome = produto.nome;
      pro.descricao = produto.descricao;
      pro.imagem = produto.imagem;
      pro.preco = produto.preco;
      pro.categoria = produto.categoria;
      produtos.add(pro);
    });

    p2.forEach((produto) {
      ProdutoGeral pro = ProdutoGeral();
      pro.nome = produto.name;
      pro.descricao = produto.description;
      pro.imagem = produto.gallery![0];
      pro.preco = produto.price;
      pro.categoria = produto.details!.material!;
      produtos.add(pro);
    });

    listaCarregada = true;
    print(listaCarregada);
  }
}
