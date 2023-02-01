import 'package:e_comerce/models/produto_1.dart';
import 'package:e_comerce/models/produto_2.dart';
import 'package:e_comerce/pages/cart/cart_screen.dart';
import 'package:e_comerce/pages/home/widgets/container_produtos.dart';
import 'package:e_comerce/service/http_request.dart';
import 'package:e_comerce/store/home_store.dart';
import 'package:e_comerce/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeStore store;
  List<Produto1> p1 = [];
  List<Produto2> p2 = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    store = Provider.of<HomeStore>(context);
  }

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
            Observer(builder: (_) {
              if (store.isLogged) {
                return TextButton.icon(
                    onPressed: () {
                      print("teeste");
                    },
                    icon: Icon(
                      Icons.login,
                      color: Color(0xffEDF2F4),
                    ),
                    label: Text(
                      "Login",
                      style: TextStyle(color: Color(0xffEDF2F4), fontSize: 20),
                    ));
              } else {
                return TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  CartScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Color(0xffEDF2F4),
                    ),
                    label: Text(
                      "Meu Carrinho",
                      style: TextStyle(color: Color(0xffEDF2F4), fontSize: 20),
                    ));
              }
            })
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
                Observer(builder: (_) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 25),
                      child: CustomInput(
                        hint: "Pesquisar Produto",
                        onChange: store.setInputPesquisa,
                      ),
                    ),
                  );
                }),
                Observer(builder: (_) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 25),
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
                            hint: store.categoria == ""
                                ? Text(
                                    "Categorias",
                                    style: TextStyle(
                                      color: Color(0xff2B2D42),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                : Text(store.categoria),
                            items: store.categorias
                                .map((String dropDownStringItem) {
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
                              store.setCategoria(value!);
                              // print(value);
                              // dropdownCallback(value);
                            }),
                      ),
                    ),
                  );
                }),
                Observer(builder: (_) {
                  return Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 25),
                    child: IconButton(
                        onPressed: (() {
                          store.setCategoria("");
                        }),
                        icon: Icon(
                          Icons.clear_rounded,
                          color: Color(0xffEDF2F4),
                        )),
                  );
                }),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        ),
        Observer(builder: (_) {
          if (store.listaCarregada) {
            return Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: !store.isFiltrar
                      ? store.produtos.length
                      : store.produtosFitrados.length,
                  itemBuilder: ((context, index) {
                    return ContainerProdutos(
                      produtoGeral: store.isFiltrar
                          ? store.produtosFitrados[index]
                          : store.produtos[index],
                      addOrRemove: store.addOrRemoveCarrinho,
                    );
                  }),
                );
              }),
            );
          }
          return CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color(0xffEDF2F4)),
          );
        })
      ]),
    );
  }
}
