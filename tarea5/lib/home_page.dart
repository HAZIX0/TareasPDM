import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea5/details_page.dart';
import 'package:tarea5/forage_provider.dart';
import 'package:tarea5/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: ListView.builder(
        itemCount: context.watch<ForageProvider>().getItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(context.watch<ForageProvider>().getItems[index].name),
            subtitle:
                Text(context.watch<ForageProvider>().getItems[index].location),
            onTap: () {
              context.read<ForageProvider>().deleteItem();
              context.read<ForageProvider>().setSelectedIndex(index);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent.shade400,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
