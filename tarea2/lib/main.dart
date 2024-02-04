import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
          textTheme: TextTheme(
              bodyText1:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              bodyText2:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showSnackbar(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(text)),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 9, 47, 78),
              Color.fromARGB(255, 4, 24, 40),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hourly forecast'),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(255, 5, 25, 40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('16°'),
                      SizedBox(height: 25.0),
                      Icon(
                        Icons.nightlight,
                        color: Colors.lightBlue,
                      ),
                      Text('Now')
                    ],
                  ),
                  Column(
                    children: [
                      Text('14°'),
                      SizedBox(height: 25.0),
                      Icon(
                        Icons.nightlight,
                        color: Colors.lightBlue,
                      ),
                      Text('12 AM')
                    ],
                  ),
                  Column(
                    children: [
                      Text('14°'),
                      SizedBox(height: 25.0),
                      Icon(
                        Icons.nightlight,
                        color: Colors.lightBlue,
                      ),
                      Text('1 AM')
                    ],
                  ),
                  Column(
                    children: [
                      Text('13°'),
                      SizedBox(height: 25.0),
                      Icon(
                        Icons.nightlight,
                        color: Colors.lightBlue,
                      ),
                      Text('2 AM')
                    ],
                  ),
                  Column(
                    children: [
                      Text('11°'),
                      SizedBox(height: 25.0),
                      Icon(
                        Icons.nightlight,
                        color: Colors.lightBlue,
                      ),
                      Text('3 AM')
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Text('10-day forecast'),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                children: [
                  customListTile(
                      'Today', Icons.wb_sunny, '28°/9°', Colors.yellow),
                  customListTile('Tuesday', Icons.cloud, '27°/9°', Colors.grey),
                  customListTile(
                      'Wednesday', Icons.cloud, '26°/7°', Colors.grey),
                  customListTile(
                      'Thursday', Icons.wb_sunny, '28°/8°', Colors.yellow),
                  customListTile(
                      'Friday', Icons.wb_sunny, '28°/9°', Colors.yellow),
                  customListTile(
                      'Saturday', Icons.wb_sunny, '29°/10°', Colors.yellow),
                  customListTile('Sunday', Icons.cloud, '22°/5°', Colors.grey),
                  customListTile('Monday', Icons.cloud, '21°/4°', Colors.grey),
                  customListTile(
                      'Tuesday', Icons.ac_unit, '15°/0°', Colors.blue),
                  customListTile(
                      'Wednesday', Icons.cloud, '20°/3°', Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customListTile(
      String day, IconData icon, String temperature, Color iconColor) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromARGB(255, 5, 25, 40),
      ),
      margin: EdgeInsets.only(bottom: 4.0),
      child: ListTile(
        textColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                day,
                textAlign: TextAlign.start,
              ),
            ),
            Icon(icon, color: iconColor),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                temperature,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        titleTextStyle: TextStyle(fontSize: 14.0),
        onTap: () {
          showSnackbar('$day $temperature');
        },
      ),
    );
  }
}
