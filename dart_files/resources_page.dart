import 'package:flutter/material.dart';
import 'subject_page.dart';
class ResourcesPage extends StatelessWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Subject> subjects = [
      Subject(
        name: 'Algorithm analysis and design',
        icon: Icons.library_books,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilesPage()),
          );
        },
      ),
      Subject(
        name: 'Software testing',
        icon: Icons.library_books,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilesPage()),
          );
        },
      ),
      Subject(
        name: 'Python',
        icon: Icons.library_books,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilesPage()),
          );
        },
      ),
      Subject(
        name: 'Mobile App Dev',
        icon: Icons.library_books,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilesPage()),
          );
        },
      ),
      Subject(
        name: 'Cloud Computing',
        icon: Icons.library_books,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilesPage()),
          );
        },
      ),
      Subject(
        name: 'Software Architecture',
        icon: Icons.library_books,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilesPage()),
          );
        },
      ),
      Subject(
        name: 'Data Mining',
        icon: Icons.library_books,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilesPage()),
          );
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
      ),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return GestureDetector(
            onTap: subject.onTap,
            child: Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 4.0,
              child: ListTile(
                leading: Icon(
                  subject.icon,
                  size: 40.0,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  subject.name,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Subject {
  final String name;
  final IconData icon;
  final VoidCallback onTap;

  Subject({
    required this.name,
    required this.icon,
    required this.onTap,
  });
}

