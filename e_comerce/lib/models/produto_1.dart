class Produto1 {
  String? nome;
  String? descricao;
  String? categoria;
  String? imagem;
  String? preco;
  String? material;
  String? departamento;
  String? id;
  Body? body;

  Produto1(
      {this.nome,
      this.descricao,
      this.categoria,
      this.imagem,
      this.preco,
      this.material,
      this.departamento,
      this.id,
      this.body});

  Produto1.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    categoria = json['categoria'];
    imagem = json['imagem'];
    preco = json['preco'];
    material = json['material'];
    departamento = json['departamento'];
    id = json['id'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['categoria'] = this.categoria;
    data['imagem'] = this.imagem;
    data['preco'] = this.preco;
    data['material'] = this.material;
    data['departamento'] = this.departamento;
    data['id'] = this.id;
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    return data;
  }
}

class Body {
  String? nome;
  String? descricao;
  String? categoria;
  String? imagem;
  String? preco;
  String? material;
  String? departamento;
  int? userId;

  Body(
      {this.nome,
      this.descricao,
      this.categoria,
      this.imagem,
      this.preco,
      this.material,
      this.departamento,
      this.userId});

  Body.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    categoria = json['categoria'];
    imagem = json['imagem'];
    preco = json['preco'];
    material = json['material'];
    departamento = json['departamento'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['categoria'] = this.categoria;
    data['imagem'] = this.imagem;
    data['preco'] = this.preco;
    data['material'] = this.material;
    data['departamento'] = this.departamento;
    data['userId'] = this.userId;
    return data;
  }
}
