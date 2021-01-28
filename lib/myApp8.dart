import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApp8 extends StatefulWidget {
  @override
  _MyApp8State createState() => _MyApp8State();
}

class _MyApp8State extends State<MyApp8> {
  String brlBitcoin = "R\$ 0.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/bitcoin.png"),
            SizedBox(height: 40,),
            Text(brlBitcoin, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            RaisedButton(
              child: Text("Atualizar", style: TextStyle(color: Colors.white, fontSize: 18),),
                color: Colors.orange,
                onPressed: (){
                   pesquisarValor();

                }),
          ],
        ),
      ),
    );
  }

  pesquisarValor() async{
    //"BRL" : {"15m" : 174954.07,
    // "last" : 174954.07,
    // "buy" : 174954.07,
    // "sell" : 174954.07,
    // "symbol" : "R$"},
      String url = "https://blockchain.info/ticker";
      http.Response response = await http.get(url);
      Map<String, dynamic> dados = json.decode(response.body);

      print(dados["BRL"]["last"]);

      setState(() {
         brlBitcoin = "${dados["BRL"]["symbol"]} ${dados["BRL"]["buy"]}";
      });





  }

}
