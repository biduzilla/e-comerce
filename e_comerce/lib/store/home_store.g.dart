// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$categoriaAtom =
      Atom(name: 'HomeStoreBase.categoria', context: context);

  @override
  String get categoria {
    _$categoriaAtom.reportRead();
    return super.categoria;
  }

  @override
  set categoria(String value) {
    _$categoriaAtom.reportWrite(value, super.categoria, () {
      super.categoria = value;
    });
  }

  late final _$inputPesquisaAtom =
      Atom(name: 'HomeStoreBase.inputPesquisa', context: context);

  @override
  String get inputPesquisa {
    _$inputPesquisaAtom.reportRead();
    return super.inputPesquisa;
  }

  @override
  set inputPesquisa(String value) {
    _$inputPesquisaAtom.reportWrite(value, super.inputPesquisa, () {
      super.inputPesquisa = value;
    });
  }

  late final _$p1Atom = Atom(name: 'HomeStoreBase.p1', context: context);

  @override
  List<Produto1> get p1 {
    _$p1Atom.reportRead();
    return super.p1;
  }

  @override
  set p1(List<Produto1> value) {
    _$p1Atom.reportWrite(value, super.p1, () {
      super.p1 = value;
    });
  }

  late final _$p2Atom = Atom(name: 'HomeStoreBase.p2', context: context);

  @override
  List<Produto2> get p2 {
    _$p2Atom.reportRead();
    return super.p2;
  }

  @override
  set p2(List<Produto2> value) {
    _$p2Atom.reportWrite(value, super.p2, () {
      super.p2 = value;
    });
  }

  late final _$listaCarregadaAtom =
      Atom(name: 'HomeStoreBase.listaCarregada', context: context);

  @override
  bool get listaCarregada {
    _$listaCarregadaAtom.reportRead();
    return super.listaCarregada;
  }

  @override
  set listaCarregada(bool value) {
    _$listaCarregadaAtom.reportWrite(value, super.listaCarregada, () {
      super.listaCarregada = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setCategoria(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCategoria');
    try {
      return super.setCategoria(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInputPesquisa(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setInputPesquisa');
    try {
      return super.setInputPesquisa(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setP1(List<Produto1> lst) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setP1');
    try {
      return super.setP1(lst);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setP2(List<Produto2> lst) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setP2');
    try {
      return super.setP2(lst);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void popularProdutos() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.popularProdutos');
    try {
      return super.popularProdutos();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoria: ${categoria},
inputPesquisa: ${inputPesquisa},
p1: ${p1},
p2: ${p2},
listaCarregada: ${listaCarregada}
    ''';
  }
}
