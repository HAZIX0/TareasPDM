import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> buttonSelectedState = [false, false, false, false];

  void showSnackbar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mc Flutter'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 48.0,
                  ),
                  Column(
                    children: [
                      Text(
                        'Flutter McFlutter',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        'Experienced App Developer',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '123 Main Street',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    '(415) 555-0198',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildIconButton(Icons.email, 'mcflutter@gmail.com', 0),
                  buildIconButton(Icons.schedule, 'Mon-Fri: 8:00-19:00', 1),
                  buildIconButton(Icons.call, 'Calling Mc Flutter...', 2),
                  buildIconButton(
                      Icons.directions, '123 Main Street on Google Maps', 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon, String snackBarText, int index) {
    return IconButton(
      onPressed: () {
        showSnackbar(snackBarText);
        setState(() {
          buttonSelectedState[index] = !buttonSelectedState[index];
        });
      },
      icon: Icon(icon),
      color: buttonSelectedState[index] ? Colors.indigo : Colors.black,
    );
  }
}
