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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme:
              IconThemeData(color: Color(0xffEDF2F4) //change your color here
                  ),
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
                    return ContainerProdutos(
                      produtoGeral: store.produtosCarrinho[index],
                      addOrRemove: (ProdutoGeral) {},
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
                  print("object");
                },
                child: Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 80),
                    child: Text(
                      "Finalizar Compra",
                      style: TextStyle(fontSize: 26, color: Color(0xffEDF2F4)),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
