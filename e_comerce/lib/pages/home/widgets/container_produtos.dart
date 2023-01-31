import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContainerProdutos extends StatelessWidget {
  const ContainerProdutos(
      {super.key,
      required this.urlImg,
      required this.nome,
      required this.descricao,
      required this.preco,
      required this.add,
      required this.categoria});

  final String urlImg;
  final String nome;
  final String descricao;
  final String preco;
  final String categoria;
  final Function add;

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
                urlImg,
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
                    nome,
                    style: TextStyle(
                        color: Color(0xffEDF2F4),
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Text(
                    descricao,
                    style: TextStyle(color: Color(0xffEDF2F4), fontSize: 16),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Text(
                    categoria,
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
                  "Preço \$${preco}",
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
                      print("object");
                    },
                    icon: Icon(Icons.add_shopping_cart),
                    label: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 80),
                      child: Text(
                        "Adicionar ao Carrinho",
                        style:
                            TextStyle(fontSize: 26, color: Color(0xffEDF2F4)),
                      ),
                    ),
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
