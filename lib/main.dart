import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Homescreen(),
  ));
}

class Homescreen extends StatelessWidget {
  final List<Map<String, String>> students = [
    {
      'name': 'Septian Wijaya',
      'Nim': '32210072',
      'birthdate': '15-09-2001',
    },
    {
      'name': 'William',
      'Nim': '32210022',
      'birthdate': '14-02-2003',
    },
    {
      'name': 'Daniel Alexander',
      'Nim': '32210075',
      'birthdate': '25-10-2002',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelompok 6'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(students[index]['name'] ?? 'Name not provided'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => AnotherScreen(student: students[index]),
              ));
            },
          );
        },
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  final Map<String, String> student;

  AnotherScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details for ${student['name'] ?? 'Name not provided'}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Name: ${student['name'] ?? 'Name not provided'}'),
          ),
          ListTile(
            title: Text('NIM: ${student['Nim'] ?? 'NIM not provided'}'),
          ),
          ListTile(
            title: Text(
                'Birthdate: ${student['birthdate'] ?? 'Birthdate not provided'}'),
          ),
        ],
      ),
    );
  }
}
