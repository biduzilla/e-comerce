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
  bool isLogged = false;

  @observable
  bool listaCarregada = false;

  ObservableList<ProdutoGeral> produtos = ObservableList();

  ObservableList<ProdutoGeral> produtosCarrinho = ObservableList();

  ObservableList<ProdutoGeral> produtosFitrados = ObservableList();

  ObservableList<String> categorias = ObservableList();

  int i = 0;

  @action
  void addOrRemoveCarrinho(ProdutoGeral produto) {
    if (produto.isAdd) {
      produtosCarrinho.add(produto);
    } else {
      produtosCarrinho.remove(produto);
    }

    // if (isFiltrar) {
    //   produtosFitrados.forEach((element) {
    //     if (element.id == produto.id) {
    //       element.isAdd = !element.isAdd;
    //     }
    //   });
    // } else {
    //   produtos.forEach((element) {
    //     if (element.id == produto.id) {
    //       element.isAdd = !element.isAdd;
    //     }
    //   });
    // }
    print(produtosCarrinho.length);
  }

  @action
  void plus() {
    i++;
    print(i);
  }

  @action
  void setCategoria(String value) {
    listaCarregada = false;
    produtosFitrados.clear();
    categoria = value;
    produtos.forEach((produto) {
      if (produto.categoria == value) {
        produtosFitrados.add(produto);
      }
    });
    recarregarList();
  }

  @action
  void setInputPesquisa(String value) {
    listaCarregada = false;

    RegExp exp = new RegExp(
      "\\b" + value + "\\b",
      caseSensitive: false,
    );

    produtosFitrados.clear();
    inputPesquisa = value;
    produtos.forEach((produto) {
      if (exp.hasMatch(produto.nome!)) {
        produtosFitrados.add(produto);
      }
    });
    recarregarList();
  }

  @action
  void setP1(List<Produto1> lst) {
    p1 = lst;
  }

  @action
  void setP2(List<Produto2> lst) {
    p2 = lst;
  }

  @action
  void searchCat(String value) => print(categorias.contains(value));

  @action
  void getCategorias() {
    List<String> lst = [];
    produtos.forEach((produto) {
      if (!lst.contains(produto.categoria!)) {
        lst.add(produto.categoria!);
      }
    });

    lst = lst.toSet().toList();
    categorias.addAll(lst);
  }

  @action
  void popularProdutos() {
    p1.forEach((produto) {
      ProdutoGeral pro = ProdutoGeral();
      pro.nome = produto.nome;
      pro.descricao = produto.descricao;
      pro.imagem = produto.imagem;
      pro.preco = produto.preco;
      pro.categoria = produto.departamento;
      pro.id = produtos.length;
      produtos.add(pro);
    });

    p2.forEach((produto) {
      ProdutoGeral pro = ProdutoGeral();
      pro.nome = produto.name;
      pro.descricao = produto.description;
      pro.imagem = produto.gallery![0];
      pro.preco = produto.price;
      pro.categoria = produto.details!.material!;
      pro.id = produtos.length;
      produtos.add(pro);
    });
    getCategorias();
    listaCarregada = true;
  }

  @computed
  bool get isFiltrar => inputPesquisa != "" || categoria != "";

  @computed
  bool get isCarrinhoVazio => produtosCarrinho.length == 0;

  @action
  Future<void> recarregarList() async {
    await Future.delayed(Duration(milliseconds: 300));
    listaCarregada = true;
  }
}
