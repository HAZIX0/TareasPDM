import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  const MenuList({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final List<String> menu;

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explore the restaurant's delicious menu items below!",
            style: TextStyle(fontSize: 16.0),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.menu.length,
              itemBuilder: (BuildContext context, int index) {
                final item = widget.menu[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      _selectedItem = _selectedItem == item ? null : item;
                    });
                  },
                  leading: Image.asset(
                    getValidImagePath('assets/' + item) + '.png',
                    scale: 5.0,
                  ),
                  tileColor:
                      _selectedItem == item ? Colors.lightBlue.shade100 : null,
                );
              },
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Pickup"),
                            content: _selectedItem == null
                                ? Text("Seleccione un platillo")
                                : Text("${_selectedItem}"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          )),
                  child: Text("Pickup"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                SizedBox(width: 30.0),
                VerticalDivider(
                  thickness: 4,
                  width: 20,
                  color: Color.fromARGB(255, 226, 223, 223),
                ),
                SizedBox(width: 30.0),
                ElevatedButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("Delivery"),
                            content: _selectedItem == null
                                ? Text("Seleccione un platillo")
                                : Text("${_selectedItem}"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          )),
                  child: Text("Delivery"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String getValidImagePath(String filename) {
    return filename.replaceAll(' ', '_');
  }
}
