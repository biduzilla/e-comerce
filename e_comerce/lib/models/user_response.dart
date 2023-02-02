class UserResponse {
  String? sId;
  String? nome;
  int? telefone;
  String? cidade;
  int? iV;
  List<Produtos>? produtos;

  UserResponse(
      {this.sId,
      this.nome,
      this.telefone,
      this.cidade,
      this.iV,
      this.produtos});

  UserResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nome = json['nome'];
    telefone = json['telefone'];
    cidade = json['cidade'];
    iV = json['__v'];
    if (json['produtos'] != null) {
      produtos = <Produtos>[];
      json['produtos'].forEach((v) {
        produtos!.add(new Produtos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    data['cidade'] = this.cidade;
    data['__v'] = this.iV;
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
  String? sId;

  Produtos({this.nome, this.descricao, this.imagem, this.preco, this.sId});

  Produtos.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    imagem = json['imagem'];
    preco = json['preco'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['imagem'] = this.imagem;
    data['preco'] = this.preco;
    data['_id'] = this.sId;
    return data;
  }
}
