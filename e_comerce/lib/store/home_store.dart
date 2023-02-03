import 'package:e_comerce/models/produto_1.dart';
import 'package:e_comerce/models/produto_2.dart';
import 'package:e_comerce/models/produto_geral.dart';
import 'package:e_comerce/models/user_request.dart';
import 'package:e_comerce/models/user_response.dart';
import 'package:e_comerce/service/http_request.dart';
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

  @observable
  num somaProdutos = 0.0;

  @observable
  String nome = "";

  @observable
  String telefone = "";

  @observable
  String cidade = "";

  @observable
  UserResponse userResponse = UserResponse();

  @observable
  String reponseJson = "";

  ObservableList<ProdutoGeral> produtos = ObservableList();

  ObservableList<ProdutoGeral> produtosCarrinho = ObservableList();

  ObservableList<ProdutoGeral> produtosFitrados = ObservableList();

  ObservableList<String> categorias = ObservableList();

  void login() async {
    UserRequest user = UserRequest();
    user.nome = nome;
    user.telefone = int.parse(telefone);
    user.cidade = cidade;

    userResponse = await HttpRequest.cadastrarUser(user);
    isLogged = true;
  }

  void fecharVenda() async {
    UserRequest user = UserRequest();
    user.nome = nome;
    user.telefone = int.parse(telefone);
    user.cidade = cidade;
    List<ProdutosR> produtosLst = [];
    produtosCarrinho.forEach((prod) {
      ProdutosR produtos = ProdutosR();
      produtos.nome = prod.nome;
      produtos.descricao = prod.descricao;
      produtos.preco = prod.preco;
      produtos.imagem = prod.imagem;
      produtosLst.add(produtos);
    });
    user.produtos = produtosLst;

    String reponseJson =
        await HttpRequest.finalizarCompra(user, userResponse.sId!);
    print(reponseJson);
  }

  @action
  void setLogged() => isLogged = true;

  @action
  void setNome(String value) => nome = value;

  @action
  void setCidade(String value) => cidade = value;

  @action
  void setTelefone(String value) => telefone = value;

  @action
  void addOrRemoveCarrinho(ProdutoGeral produto) {
    if (produto.isAdd) {
      produtosCarrinho.add(produto);
      somaProdutos += num.parse(produto.preco!);
    } else {
      produtosCarrinho.remove(produto);
      somaProdutos -= num.parse(produto.preco!);
    }

    if (isFiltrar) {
      produtosFitrados.forEach((element) {
        if (element.id == produto.id) {
          element.isAdd = produto.isAdd;
        }
      });
    } else {
      produtos.forEach((element) {
        if (element.id == produto.id) {
          element.isAdd = produto.isAdd;
        }
      });
    }
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
  bool get isTelefoneValid => RegExp(r'^[0-9]+$').hasMatch(telefone);

  @computed
  bool get isCarrinhoVazio => produtosCarrinho.length == 0;

  @computed
  bool get isFormValid => isTelefoneValid && nome != "" && cidade != "";

  @action
  Future<void> recarregarList() async {
    await Future.delayed(Duration(milliseconds: 300));
    listaCarregada = true;
  }
}
