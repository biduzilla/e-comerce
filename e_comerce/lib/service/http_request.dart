import 'package:e_comerce/models/produto_1.dart';
import 'package:e_comerce/models/produto_2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpRequest {
  static Future<List<Produto1>> getProdutos1() async {
    var url = Uri.parse(
        'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*",
        'Accept': '*/*'
      },
    );

    String source = Utf8Decoder().convert(response.bodyBytes);
    List<Produto1> produtos =
        (json.decode(source) as List).map((e) => Produto1.fromJson(e)).toList();
    return produtos;
  }

  static Future<List<Produto2>> getProdutos2() async {
    var url = Uri.parse(
        'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/european_provider');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*",
        'Accept': '*/*'
      },
    );

    String source = Utf8Decoder().convert(response.bodyBytes);
    List<Produto2> produtos =
        (json.decode(source) as List).map((i) => Produto2.fromJson(i)).toList();
    // print(source);
    return produtos;
  }
}
