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
      ]),
    );
  }

  void dropdownCallback(String? value) {
    if (value is String) {
      hint = value;
    }
  }
}
