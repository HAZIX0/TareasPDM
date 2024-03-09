import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea5/forage_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forage'),
      ),
      body: SingleChildScrollView(
        reverse: false,
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                controller: context.watch<ForageProvider>().getNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller:
                    context.watch<ForageProvider>().getLocationController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  labelText: 'Location',
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Checkbox(
                    value: context.watch<ForageProvider>().getIsInSeason,
                    onChanged: (newValue) {
                      context
                          .read<ForageProvider>()
                          .setIsInSeasonSelected(newValue!);
                    },
                  ),
                  Text('Currently in season'),
                ],
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: context.watch<ForageProvider>().getNotesController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  labelText: 'Notes',
                ),
              ),
              SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<ForageProvider>().addItem();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'SAVE',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.deepPurpleAccent.shade400),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.0),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ForageProvider>().deleteItem();
                    },
                    child: Text(
                      'DELETE',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.deepPurpleAccent.shade400),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
