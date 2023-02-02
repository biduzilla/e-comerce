import 'package:e_comerce/models/produto_geral.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ItemCarrinho extends StatelessWidget {
  const ItemCarrinho({
    super.key,
    required this.addOrRemove,
    required this.produtoGeral,
    required this.reloadProdutos,
  });

  final Function(ProdutoGeral) addOrRemove;
  final Function reloadProdutos;
  final ProdutoGeral produtoGeral;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height / 60),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xffEF233C), borderRadius: BorderRadius.circular(10)),
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
                        color: Color(0xffEDF2F4),
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Text(
                    produtoGeral.descricao!,
                    style: TextStyle(color: Color(0xffEDF2F4), fontSize: 16),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Text(
                    produtoGeral.categoria!,
                    style: TextStyle(color: Colors.amber, fontSize: 14),
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
                      color: Color(0xffEDF2F4),
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
                      produtoGeral.isAdd = false;
                      addOrRemove(produtoGeral);
                      reloadProdutos();
                    },
                    icon: Icon(Icons.remove_shopping_cart),
                    label: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height / 80),
                        child: Text(
                          "Remover Produto",
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
