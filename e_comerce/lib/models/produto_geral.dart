import 'package:e_comerce/store/home_store.dart';

class ProdutoGeral {
  int? id;
  String? nome;
  String? descricao;
  String? imagem;
  String? preco;
  String? categoria;
  bool isAdd = false;

  ProdutoGeral({
    this.id,
    this.nome,
    this.descricao,
    this.imagem,
    this.preco,
    this.categoria,
  });
}
