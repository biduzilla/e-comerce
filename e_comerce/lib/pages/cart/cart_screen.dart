import 'package:e_comerce/pages/cart/widget/item_carrinho.dart';
import 'package:e_comerce/pages/home/widgets/container_produtos.dart';
import 'package:e_comerce/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late HomeStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<HomeStore>(context);
  }

  Future alertDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          content: Container(
            height: 500,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffEF233C),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Deseja Finalizar Compra?",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffEDF2F4),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.clear_outlined,
                              size: 30,
                              color: Color(0xffEDF2F4),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                Text(
                  "Valor Total: \$${store.somaProdutos}",
                  style: TextStyle(color: Color(0xff2B2D42), fontSize: 22),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: store.produtosCarrinho.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            " - ${store.produtosCarrinho[index].nome!}",
                            style: TextStyle(
                                color: Color(0xff2B2D42), fontSize: 16),
                          ),
                        );
                      })),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width / 40,
                      horizontal: MediaQuery.of(context).size.width / 20),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xffEF233C),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              // Change your radius here
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {
                          store.fecharVenda();
                          repostaJson();
                        },
                        child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height / 80),
                            child: Text(
                              "Finalizar Compra",
                              style: TextStyle(
                                  fontSize: 26, color: Color(0xffEDF2F4)),
                            )),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future repostaJson() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          content: Container(
            height: 500,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffEF233C),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Resposta Json",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffEDF2F4),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.clear_outlined,
                              size: 30,
                              color: Color(0xffEDF2F4),
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                Text(
                  store.reponseJson,
                  style: TextStyle(color: Color(0xff2B2D42), fontSize: 22),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xffEDF2F4)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Meu Carrinho",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Icons.shopping_cart,
                size: 30,
              )
            ],
          )),
      body: Column(
        children: [
          Expanded(
            child: Observer(builder: (_) {
              if (!store.isCarrinhoVazio) {
                return ListView.builder(
                  itemCount: store.produtosCarrinho.length,
                  itemBuilder: ((context, index) {
                    return ItemCarrinho(
                      produtoGeral: store.produtosCarrinho[index],
                      addOrRemove: store.addOrRemoveCarrinho,
                      reloadProdutos: store.recarregarList,
                    );
                  }),
                );
              } else {
                return Column();
              }
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width / 40,
                horizontal: MediaQuery.of(context).size.width / 20),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xffEF233C),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        // Change your radius here
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    alertDialog();
                  },
                  child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 80),
                      child: Text(
                        "Finalizar Compra",
                        style:
                            TextStyle(fontSize: 26, color: Color(0xffEDF2F4)),
                      )),
                )),
          )
        ],
      ),
    );
  }
}
