import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class GrowTo extends StatelessWidget {
  const GrowTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //theme: ThemeData.light().copyWith(scaffoldBackgroundColor: CupertinoColors.lightBackgroundGray),
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: ExampleParallax(),
        ),
      ),
    );
  }
}

class ExampleParallax extends StatelessWidget {
  const ExampleParallax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (locations.length / 2).ceil(),
      itemBuilder: (context, index) {
        final startIndex = index * 2;
        final endIndex = startIndex + 2 < locations.length ? startIndex + 2 : locations.length;
        final locationsToShow = locations.getRange(startIndex, endIndex).toList();
        return Row(
          children: [
            for (final location in locationsToShow)
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _showLocationDetailsDialog(context, location);
                  },
                  child: LocationListItem(
                    name: location.name,
                    company: location.company,
                    imagePath: location.imagePath,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  void _showLocationDetailsDialog(BuildContext context, Location location) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(location.imagePath),
              ),
              const SizedBox(height: 10),
              Text(
                location.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              Text(
                location.company,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              // Display LinkedIn handle as a clickable link
              GestureDetector(
                onTap: () async {
                  final url = 'https://www.linkedin.com/in/${location.linkedIn}';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not launch LinkedIn profile.')),
                    );
                  }
                },
                child: Text(
                  '@${location.linkedIn}',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              // Display contact info
              Text(
                'Contact: ${location.contactInfo}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              // Display about info
              Text(
                'About: ${location.about}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class LocationListItem extends StatelessWidget {
  const LocationListItem({
    Key? key,
    required this.name,
    required this.company,
    required this.imagePath,
  }) : super(key: key);

  final String name;
  final String company;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double textSize = screenWidth * 0.03;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: Colors.grey,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: textSize * 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        company,
                        style: TextStyle(
                          fontSize: textSize,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Location {
  const Location({
    required this.name,
    required this.company,
    required this.imagePath,
    required this.contactInfo,
    required this.about,
    required this.linkedIn, // Add LinkedIn field
  });

  final String name;
  final String company;
  final String imagePath;
  final String contactInfo;
  final String about;
  final String linkedIn; // LinkedIn handle
}


const locations = [
  Location(
    name: 'Swapnil Singh',
    company: 'KLA',
    imagePath: 'assets/p9.png',
    contactInfo: 'swapnil@example.com',
    about: 'Swapnil is an engineer at KLA and loves coding.',
    linkedIn: 'ssinghalong',
  ),
  Location(
    name: 'Anamika Gupta',
    company: 'Nvidia',
    imagePath: 'assets/p4.png',
    contactInfo: 'Anamika@example.com',
    about: 'Anamika is an engineer at Nvidia and loves coding.',
    linkedIn: 'anamika-gupta-a3b88924b',
  ),
  Location(
    name: 'Satyam Gupta',
    company: 'Oracle',
    imagePath: 'assets/p7.png',
    contactInfo: 'Satyam@example.com',
    about: 'Satyam is an engineer at Oracle and loves coding.',
    linkedIn: 'satyam-gupta-4a513720b',
  ),
  Location(
    name: 'Aditi Singh',
    imagePath: 'assets/p2.png',
    contactInfo: 'Aditi@example.com',
    about: 'Aditi is an engineer at Microsoft and loves coding.',
    linkedIn: 'aditi-singh-163519179',
    company: 'Microsoft',
  ),
  Location(
    name: 'Divya sharma',
    imagePath: 'assets/p6.png',
    contactInfo: 'Divya@example.com',
    about: 'Divya is an engineer at Google and loves coding.',
    linkedIn: 'divya-sharma-356277264',
    company: 'Google',
  ),
  Location(
    name: 'Bali Prakash',
    imagePath: 'assets/p10.png',
    contactInfo: 'Bali@example.com',
    about: 'Bali is an engineer at Amazon and loves coding.',
    linkedIn: 'avani-bali-84582918a',
    company: 'Amazon',
  ),
  Location(
    name: 'Animesh Paswan',
    imagePath: 'assets/p1.png',
    contactInfo: 'Animesh@example.com',
    about: 'Animesh is an engineer at Amdocs and loves coding.',
    linkedIn: 'animesh-paswan-2250a61b0',
    company: 'Amdocs',
  ),
  Location(
    name: 'Ankit Gourav',
    imagePath: 'assets/p5.png',
    contactInfo: 'Ankit@example.com',
    about: 'Ankit is an engineer at Aihub and loves coding.',
    linkedIn: 'ankitgourav',
    company: 'Aihub',
  ),
  Location(
    name: 'Deepak Batour',
    imagePath: 'assets/p8.png',
    contactInfo: 'Deepak@example.com',
    about: 'Deepak is an engineer at GenAi and loves coding.',
    linkedIn: 'deepak-batour-527733258',
    company: 'GenAi',
  ),
  Location(
    name: 'Dipesh Rathod',
    imagePath: 'assets/p3.png',
    contactInfo: 'Dipesh@example.com',
    about: 'Dipesh is an engineer at Cisco and loves coding.',
    linkedIn: 'dipesh-mangrora-6085a2264',
    company: 'Cisco',
  ),
  Location(
    name: 'Rinku Singh',
    company: 'KLA',
    imagePath: 'assets/p9.png',
    contactInfo: 'swapnil@example.com',
    about: 'Swapnil is an engineer at KLA and loves coding.',
    linkedIn: 'ssinghalong',
  ),
  Location(
    name: 'Amishi Gupta',
    company: 'Nvidia',
    imagePath: 'assets/p4.png',
    contactInfo: 'Anamika@example.com',
    about: 'Anamika is an engineer at Nvidia and loves coding.',
    linkedIn: 'anamika-gupta-a3b88924b',
  ),
  Location(
    name: 'Harshita Gupta',
    company: 'Oracle',
    imagePath: 'assets/p7.png',
    contactInfo: 'Satyam@example.com',
    about: 'Satyam is an engineer at Oracle and loves coding.',
    linkedIn: 'satyam-gupta-4a513720b',
  ),
  Location(
    name: 'Aditi Patil',
    imagePath: 'assets/p2.png',
    contactInfo: 'Aditi@example.com',
    about: 'Aditi is an engineer at Microsoft and loves coding.',
    linkedIn: 'aditi-singh-163519179',
    company: 'Microsoft',
  ),
  Location(
    name: 'Anushka sharma',
    imagePath: 'assets/p6.png',
    contactInfo: 'Divya@example.com',
    about: 'Divya is an engineer at Google and loves coding.',
    linkedIn: 'divya-sharma-356277264',
    company: 'Google',
  ),
  Location(
    name: 'Baldev singh',
    imagePath: 'assets/p10.png',
    contactInfo: 'Bali@example.com',
    about: 'Bali is an engineer at Amazon and loves coding.',
    linkedIn: 'avani-bali-84582918a',
    company: 'Amazon',
  ),
  Location(
    name: 'Any bansal',
    imagePath: 'assets/p1.png',
    contactInfo: 'Animesh@example.com',
    about: 'Animesh is an engineer at Amdocs and loves coding.',
    linkedIn: 'animesh-paswan-2250a61b0',
    company: 'Amdocs',
  ),
  Location(
    name: 'Sanket Gourav',
    imagePath: 'assets/p5.png',
    contactInfo: 'Ankit@example.com',
    about: 'Ankit is an engineer at Aihub and loves coding.',
    linkedIn: 'ankitgourav',
    company: 'Aihub',
  ),
  Location(
    name: 'Deepak kumar',
    imagePath: 'assets/p8.png',
    contactInfo: 'Deepak@example.com',
    about: 'Deepak is an engineer at GenAi and loves coding.',
    linkedIn: 'deepak-batour-527733258',
    company: 'GenAi',
  ),
  Location(
    name: 'Dipesh Mangrora',
    imagePath: 'assets/p3.png',
    contactInfo: 'Dipesh@example.com',
    about: 'Dipesh is an engineer at Cisco and loves coding.',
    linkedIn: 'dipesh-mangrora-6085a2264',
    company: 'Cisco',
  ),
  Location(
    name: 'Swapnil Singh',
    company: 'KLA',
    imagePath: 'assets/p9.png',
    contactInfo: 'swapnil@example.com',
    about: 'Swapnil is an engineer at KLA and loves coding.',
    linkedIn: 'ssinghalong',
  ),
  Location(
    name: 'Anamika Gupta',
    company: 'Nvidia',
    imagePath: 'assets/p4.png',
    contactInfo: 'Anamika@example.com',
    about: 'Anamika is an engineer at Nvidia and loves coding.',
    linkedIn: 'anamika-gupta-a3b88924b',
  ),
  Location(
    name: 'Satyam Gupta',
    company: 'Oracle',
    imagePath: 'assets/p7.png',
    contactInfo: 'Satyam@example.com',
    about: 'Satyam is an engineer at Oracle and loves coding.',
    linkedIn: 'satyam-gupta-4a513720b',
  ),
  Location(
    name: 'Aditi Singh',
    imagePath: 'assets/p2.png',
    contactInfo: 'Aditi@example.com',
    about: 'Aditi is an engineer at Microsoft and loves coding.',
    linkedIn: 'aditi-singh-163519179',
    company: 'Microsoft',
  ),
  Location(
    name: 'Divya sharma',
    imagePath: 'assets/p6.png',
    contactInfo: 'Divya@example.com',
    about: 'Divya is an engineer at Google and loves coding.',
    linkedIn: 'divya-sharma-356277264',
    company: 'Google',
  ),
  Location(
    name: 'Bali Prakash',
    imagePath: 'assets/p10.png',
    contactInfo: 'Bali@example.com',
    about: 'Bali is an engineer at Amazon and loves coding.',
    linkedIn: 'avani-bali-84582918a',
    company: 'Amazon',
  ),
  Location(
    name: 'Animesh Paswan',
    imagePath: 'assets/p1.png',
    contactInfo: 'Animesh@example.com',
    about: 'Animesh is an engineer at Amdocs and loves coding.',
    linkedIn: 'animesh-paswan-2250a61b0',
    company: 'Amdocs',
  ),
  Location(
    name: 'Ankit Gourav',
    imagePath: 'assets/p5.png',
    contactInfo: 'Ankit@example.com',
    about: 'Ankit is an engineer at Aihub and loves coding.',
    linkedIn: 'ankitgourav',
    company: 'Aihub',
  ),
  Location(
    name: 'Deepak Batour',
    imagePath: 'assets/p8.png',
    contactInfo: 'Deepak@example.com',
    about: 'Deepak is an engineer at GenAi and loves coding.',
    linkedIn: 'deepak-batour-527733258',
    company: 'GenAi',
  ),
  Location(
    name: 'Dipesh Rathod',
    imagePath: 'assets/p3.png',
    contactInfo: 'Dipesh@example.com',
    about: 'Dipesh is an engineer at Cisco and loves coding.',
    linkedIn: 'dipesh-mangrora-6085a2264',
    company: 'Cisco',
  ),
  Location(
    name: 'Swapnil Singh',
    company: 'KLA',
    imagePath: 'assets/p9.png',
    contactInfo: 'swapnil@example.com',
    about: 'Swapnil is an engineer at KLA and loves coding.',
    linkedIn: 'ssinghalong',
  ),
  Location(
    name: 'Anamika Gupta',
    company: 'Nvidia',
    imagePath: 'assets/p4.png',
    contactInfo: 'Anamika@example.com',
    about: 'Anamika is an engineer at Nvidia and loves coding.',
    linkedIn: 'anamika-gupta-a3b88924b',
  ),
  Location(
    name: 'Satyam Gupta',
    company: 'Oracle',
    imagePath: 'assets/p7.png',
    contactInfo: 'Satyam@example.com',
    about: 'Satyam is an engineer at Oracle and loves coding.',
    linkedIn: 'satyam-gupta-4a513720b',
  ),
  Location(
    name: 'Aditi Singh',
    imagePath: 'assets/p2.png',
    contactInfo: 'Aditi@example.com',
    about: 'Aditi is an engineer at Microsoft and loves coding.',
    linkedIn: 'aditi-singh-163519179',
    company: 'Microsoft',
  ),
  Location(
    name: 'Divya sharma',
    imagePath: 'assets/p6.png',
    contactInfo: 'Divya@example.com',
    about: 'Divya is an engineer at Google and loves coding.',
    linkedIn: 'divya-sharma-356277264',
    company: 'Google',
  ),
  Location(
    name: 'Bali Prakash',
    imagePath: 'assets/p10.png',
    contactInfo: 'Bali@example.com',
    about: 'Bali is an engineer at Amazon and loves coding.',
    linkedIn: 'avani-bali-84582918a',
    company: 'Amazon',
  ),
  Location(
    name: 'Animesh Paswan',
    imagePath: 'assets/p1.png',
    contactInfo: 'Animesh@example.com',
    about: 'Animesh is an engineer at Amdocs and loves coding.',
    linkedIn: 'animesh-paswan-2250a61b0',
    company: 'Amdocs',
  ),
  Location(
    name: 'Ankit Gourav',
    imagePath: 'assets/p5.png',
    contactInfo: 'Ankit@example.com',
    about: 'Ankit is an engineer at Aihub and loves coding.',
    linkedIn: 'ankitgourav',
    company: 'Aihub',
  ),
  Location(
    name: 'Deepak Batour',
    imagePath: 'assets/p8.png',
    contactInfo: 'Deepak@example.com',
    about: 'Deepak is an engineer at GenAi and loves coding.',
    linkedIn: 'deepak-batour-527733258',
    company: 'GenAi',
  ),
  Location(
    name: 'Dipesh Rathod',
    imagePath: 'assets/p3.png',
    contactInfo: 'Dipesh@example.com',
    about: 'Dipesh is an engineer at Cisco and loves coding.',
    linkedIn: 'dipesh-mangrora-6085a2264',
    company: 'Cisco',
  ),
];
