import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Homescreen(),
  ));
}

class Homescreen extends StatelessWidget {
  final List<Map<String, String?>> biodata = [
    {
      'name': 'Septian Wijaya',
      'Nim': '32210072',
    },
    {
      'name': 'William',
      'Nim': '32210022',
    },
    {
      'name': 'Daniel Alexander',
      'Nim': '32210075',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelompok 6'),
      ),
      body: ListView.builder(
        itemCount: biodata.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(biodata[index]['name'] ?? 'Name not provided'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('NIM: ${biodata[index]['Nim'] ?? 'NIM not provided'}'),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => AnotherScreen(biodata: biodata[index]),
              ));
            },
          );
        },
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  final Map<String, String?> biodata;

  AnotherScreen({required this.biodata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details for ${biodata['name'] ?? 'Name not provided'}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Name: ${biodata['name'] ?? 'Name not provided'}'),
          ),
          ListTile(
            title: Text('NIM: ${biodata['Nim'] ?? 'NIM not provided'}'),
          ),
        ],
      ),
    );
  }
}
