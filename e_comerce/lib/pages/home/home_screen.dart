import 'package:e_comerce/models/produto_1.dart';
import 'package:e_comerce/models/produto_2.dart';
import 'package:e_comerce/pages/home/widgets/container_produtos.dart';
import 'package:e_comerce/service/http_request.dart';
import 'package:e_comerce/store/home_store.dart';
import 'package:e_comerce/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> lst = ["Amora", "Cadeira", "Cachorro", "Atriz"];
  String? hint = null;

  HomeStore store = HomeStore();
  List<Produto1> p1 = [];
  List<Produto2> p2 = [];

  @override
  void initState() {
    super.initState();

    getListProdutos();
  }

  void getListProdutos() async {
    p1 = await HttpRequest.getProdutos1();
    p2 = await HttpRequest.getProdutos2();
    store.setP1(p1);
    store.setP2(p2);
    store.popularProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Row(
          children: [
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff2B2D42),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width / 200),
                child: Text(
                  "Toddy Comerce",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
            ),
            Spacer(),
            TextButton.icon(
                onPressed: () {
                  print("teeste");
                },
                icon: Icon(
                  Icons.login,
                  color: Color(0xffEDF2F4),
                ),
                label: Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xffEDF2F4),
                  ),
                ))
          ],
        ),
      ),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(color: Color(0xffEF233C)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 50),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 25),
                    child: CustomInput(
                      hint: "Pesquisar Produto",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffEDF2F4),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: MediaQuery.of(context).size.width / 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xff2B2D42),
                          ),
                          underline: SizedBox(),
                          iconSize: 42,
                          isExpanded: true,
                          hint: Text(
                            "Categorias",
                            style: TextStyle(
                              color: Color(0xff2B2D42),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          items: lst.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              child: Text(
                                dropDownStringItem,
                                style: TextStyle(
                                    color: Color(0xff2B2D42),
                                    fontWeight: FontWeight.bold),
                              ),
                              value: dropDownStringItem,
                            );
                          }).toList(),
                          onChanged: (value) {
                            print(value);
                            dropdownCallback(value);
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return ContainerProdutos(
                    urlImg: "http://placeimg.com/640/480/cats",
                    add: () {
                      print("add");
                    },
                    descricao:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    nome: 'Nome Produto',
                    preco: "100,00",
                  );
                })))
      ]),
    );
  }

  void dropdownCallback(String? value) {
    if (value is String) {
      hint = value;
    }
  }
}
