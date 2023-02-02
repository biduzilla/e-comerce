class UserRequest {
  String? nome;
  int? telefone;
  String? cidade;
  List<Produtos>? produtos;

  UserRequest({this.nome, this.telefone, this.cidade, this.produtos});

  UserRequest.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    telefone = json['telefone'];
    cidade = json['cidade'];
    if (json['produtos'] != null) {
      produtos = <Produtos>[];
      json['produtos'].forEach((v) {
        produtos!.add(new Produtos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    data['cidade'] = this.cidade;
    if (this.produtos != null) {
      data['produtos'] = this.produtos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Produtos {
  String? nome;
  String? descricao;
  String? imagem;
  String? preco;

  Produtos({this.nome, this.descricao, this.imagem, this.preco});

  Produtos.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    imagem = json['imagem'];
    preco = json['preco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['imagem'] = this.imagem;
    data['preco'] = this.preco;
    return data;
  }
}
