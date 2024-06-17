import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({Key? key}) : super(key: key);

  @override
  _FilesPageState createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  // List of PDF files
  final List<PDFFile> pdfFiles = [
    PDFFile(
      name: 'Document 1',
      path: 'assets/resc.pdf',
      rating: 4.0,
    ),
    PDFFile(
      name: 'Document 2',
      path: 'assets/gt.pdf',
      rating: 3.5,
    ),
    PDFFile(
      name: 'Document 3',
      path: 'assets/resc.pdf',
      rating: 4.5,
    ),
    PDFFile(
      name: 'Document 4',
      path: 'assets/resc.pdf',
      rating: 5.0,
    ),
    PDFFile(
      name: 'Document 5',
      path: 'assets/resc.pdf',
      rating: 2.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Sort PDF files by rating (descending order)
    pdfFiles.sort((a, b) => b.rating.compareTo(a.rating));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Files'),
      ),
      body: ListView.builder(
        itemCount: pdfFiles.length,
        itemBuilder: (context, index) {
          final pdfFile = pdfFiles[index];
          return GestureDetector(
            onTap: () {
              // Open the PDF file in a new window
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFPage(pdfFile: pdfFile),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 4.0,
              child: ListTile(
                title: Text(pdfFile.name, textAlign: TextAlign.right),
                leading: RatingBar.builder(
                  initialRating: pdfFile.rating,
                  minRating: 0,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20.0,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  ignoreGestures: true, // Make the rating bar non-interactive
                  onRatingUpdate: (_) {
                    // No need to update the rating here, since it is non-interactive
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Class to represent each PDF file
class PDFFile {
  final String name;
  final String path;
  double rating;

  PDFFile({required this.name, required this.path, required this.rating});
}

// Page to display the PDF file and allow rating
class PDFPage extends StatefulWidget {
  final PDFFile pdfFile;

  const PDFPage({required this.pdfFile, Key? key}) : super(key: key);

  @override
  _PDFPageState createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  double newRating = 0.0;

  @override
  void initState() {
    super.initState();
    // Initialize newRating with the current rating of the PDF file
    newRating = widget.pdfFile.rating;
  }

  @override
  Widget build(BuildContext context) {
    // Log the file path for debugging purposes
    print('Opening PDF file: ${widget.pdfFile.path}');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pdfFile.name),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Display PDF file content using PDFView from flutter_pdfview
          Expanded(
            child: PDFView(
              filePath: widget.pdfFile.path,
              // Add error handling for PDFView
              onRender: (pages) {
                print('PDFView rendered $pages pages');
              },
              onError: (error) {
                print('Error in PDFView: $error');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to load PDF: $error'),
                  ),
                );
              },
              onPageError: (page, error) {
                print('Error on page $page: $error');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error on page $page: $error'),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          // Display rating bar for the user to rate the PDF file
          const Text(
            'Rate this PDF:',
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 5),
          RatingBar.builder(
            initialRating: newRating,
            minRating: 0,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 30.0,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                newRating = rating;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Save the new rating
              setState(() {
                widget.pdfFile.rating = newRating;
              });
              // Go back to the FilesPage
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
