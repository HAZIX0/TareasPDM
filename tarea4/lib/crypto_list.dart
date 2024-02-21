import 'package:flutter/material.dart';
import 'package:tarea4/details_page.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({
    super.key,
    required this.criptos,
  });

  final List criptos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: criptos.length,
      itemBuilder: (BuildContext context, int index) {
        String yearEstablished = criptos[index]["year_established"] != null
            ? criptos[index]["year_established"].toString()
            : "N/A";

        if (criptos[index]["image"] == "" || criptos[index]["image"] == null) {
          return ListTile(
            title: Text("${criptos[index]["name"]}"),
            subtitle: Text("${criptos[index]["country"]}\n$yearEstablished"),
            trailing:
                CircleAvatar(child: Text("${criptos[index]["trust_score"]}")),
            leading: Placeholder(
              fallbackHeight: 24,
              fallbackWidth: 24,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        image: "${criptos[index]["image"]}",
                        exchangeName: "${criptos[index]["name"]}",
                        date: "${criptos[index]["year_established"]}",
                        exchangeDescription: "${criptos[index]["description"]}",
                      )));
            },
          );
        } else {
          return ListTile(
            title: Text("${criptos[index]["name"]}"),
            subtitle: Text("${criptos[index]["country"]}\n$yearEstablished"),
            trailing: CircleAvatar(
              child: Text(
                "${criptos[index]["trust_score"]}",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
            leading: Image.network("${criptos[index]["image"]}"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        image: "${criptos[index]["image"]}",
                        exchangeName: "${criptos[index]["name"]}",
                        date: "${criptos[index]["year_established"]}",
                        exchangeDescription: "${criptos[index]["description"]}",
                      )));
            },
          );
        }
      },
    );
  }
}
