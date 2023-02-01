import 'package:e_comerce/models/produto_geral.dart';
import 'package:e_comerce/store/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContainerProdutos extends StatefulWidget {
  const ContainerProdutos({
    super.key,
    required this.produtoGeral,
    required this.addOrRemove,
  });

  final Function(ProdutoGeral) addOrRemove;
  final ProdutoGeral produtoGeral;
  @override
  State<ContainerProdutos> createState() =>
      _ContainerProdutosState(produtoGeral, addOrRemove);
}

class _ContainerProdutosState extends State<ContainerProdutos> {
  final ProdutoGeral produtoGeral;

  _ContainerProdutosState(this.produtoGeral, this.addOrRemove);

  HomeStore store = HomeStore();
  final Function(ProdutoGeral) addOrRemove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 60),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            color: !produtoGeral.isAdd ? Color(0xffEF233C) : Color(0xffEDF2F4),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: Image.network(
                produtoGeral.imagem!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 60,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produtoGeral.nome!,
                    style: TextStyle(
                        color: !produtoGeral.isAdd
                            ? Color(0xffEDF2F4)
                            : Color(0xffEF233C),
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Text(
                    produtoGeral.descricao!,
                    style: TextStyle(
                        color: !produtoGeral.isAdd
                            ? Color(0xffEDF2F4)
                            : Color(0xffEF233C),
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Text(
                    produtoGeral.categoria!,
                    style: TextStyle(
                        color: !produtoGeral.isAdd
                            ? Colors.amber
                            : Color(0xff2B2D42),
                        fontSize: 14),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  "Preço \$${produtoGeral.preco}",
                  style: TextStyle(
                      color: !produtoGeral.isAdd
                          ? Color(0xffEDF2F4)
                          : Color(0xffEF233C),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                SizedBox(
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff2B2D42)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          // Change your radius here
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        produtoGeral.isAdd = !produtoGeral.isAdd;
                      });
                      addOrRemove(produtoGeral);
                      // store.addOrRemoveCarrinho(produtoGeral);
                    },
                    icon: !produtoGeral.isAdd
                        ? Icon(Icons.add_shopping_cart)
                        : Icon(Icons.remove_shopping_cart),
                    label: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height / 80),
                        child: Text(
                          !produtoGeral.isAdd
                              ? "Adicionar ao Carrinho"
                              : "Remover do Carrinho",
                          style:
                              TextStyle(fontSize: 26, color: Color(0xffEDF2F4)),
                        )),
                  ),
                ),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
