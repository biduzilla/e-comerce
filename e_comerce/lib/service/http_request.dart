import 'package:e_comerce/models/produto_1.dart';
import 'package:e_comerce/models/produto_2.dart';
import 'package:e_comerce/models/user_request.dart';
import 'package:e_comerce/models/user_response.dart';
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

  static Future<bool> cadastrarUser(UserRequest user) async {
    var url = Uri.parse('localhost:80/user/');

    Map data = {
      "nome": user.nome,
      "telefone": user.telefone,
      "cidade": user.cidade,
    };

    var body = json.encode(data);

    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*'
        },
        body: body);
    print(response.body);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<UserResponse> finalizarCompra(UserRequest user) async {
    var url = Uri.parse("http://localhost:3000/user");
    Map data = {
      "nome": user.nome,
      "telefone": user.telefone,
      "cidade": user.cidade,
      "produtos": user.produtos,
    };

    var body = json.encode(data);

    var response = await http.put(url,
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*'
        },
        body: body);

    String source = Utf8Decoder().convert(response.bodyBytes);
    UserResponse userResponse = UserResponse.fromJson(jsonDecode(source));
    print(source);
    return userResponse;
  }

  static Future<void> get() async {
    var url = Uri.parse('http://localhost:3000/user');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*",
        'Accept': '*/*'
      },
    );

    String source = Utf8Decoder().convert(response.bodyBytes);

    print(source);
  }
}
