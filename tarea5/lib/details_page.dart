import 'package:flutter/material.dart';
import 'package:tarea5/forage_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.watch<ForageProvider>().getSelectedItem.name,
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(Icons.location_on_sharp),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(context.watch<ForageProvider>().getSelectedItem.location)
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
                height: 25,
                indent: 25,
                endIndent: 25,
              ),
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    context.watch<ForageProvider>().getSelectedItem.isInSeason
                        ? 'Currently in season'
                        : 'Currently out of season',
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
                height: 25,
                indent: 25,
                endIndent: 25,
              ),
              Row(
                children: [
                  Icon(Icons.notes),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(context.watch<ForageProvider>().getSelectedItem.notes)
                ],
              ),
            ],
          )),
    );
  }
}
