import 'package:flutter/material.dart';
import "quotes.dart";
import "quotes_card.dart";

void main() {
  runApp(MaterialApp(home: QuotesList()));
}

class QuotesList extends StatefulWidget {
  const QuotesList({super.key});

  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {
  List<Quotes> quotes = [
    Quotes(text: "Lentejas are the best", author: "Richard The Third"),
    Quotes(text: "I love kitty kitty cats", author: "Richard The Third"),
    Quotes(
      text:
          "it's a beautiful day outside. birds are singing, flowers are blooming... on days like these, kids like you... Should be burning in hell.",
      author: "Sans",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome quotes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        //se le pasa a la propiedad de children la lista de las frases
        //con la funcion map para ir recorriendolas, por cada frase
        //se llama a la funcion Text y se devuelve
        children: quotes
            .map(
              (quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                },
              ),
              //como la propiedad children espera una lista hay que pasar
              //los datos a una
            )
            .toList(),
      ),
    );
  }
}
