import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.image,
    required this.exchangeName,
    required this.date,
    required this.exchangeDescription,
  }) : super(key: key);

  final String image;
  final String exchangeName;
  final String date;
  final String exchangeDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: image.isNotEmpty
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(image),
                        )
                      : null,
                ),
                child: image.isNotEmpty
                    ? null
                    : Placeholder(
                        fallbackHeight: 24,
                        fallbackWidth: 24,
                      ),
              ),
              SizedBox(height: 30.0),
              Text(
                exchangeName.isNotEmpty ? exchangeName : "No disponible",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                date != "null" && date.isNotEmpty ? date : "No disponible",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.0),
              Text(
                exchangeDescription.isNotEmpty
                    ? exchangeDescription
                    : "No disponible",
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
