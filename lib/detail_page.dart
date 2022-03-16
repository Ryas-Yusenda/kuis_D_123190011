import 'package:flutter/material.dart';
// ignore: unused_import
import 'app_store.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String imageLogo;
  final String developer;
  final String genre;
  final String rating;
  final String description;
  final String appLink;
  final List<String> imageUrls;

  const DetailPage({
    Key? key,
    required this.name,
    required this.imageLogo,
    required this.developer,
    required this.genre,
    required this.rating,
    required this.description,
    required this.appLink,
    required this.imageUrls,
  }) : super(key: key);

  _launchURL() async {
    if (await canLaunch(appLink)) {
      await launch(appLink);
    } else {
      throw 'Could not launch $appLink';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 135, 95, 1),
        title: const Text('Detail AppStore'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.network(
                imageLogo,
                height: 350,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                genre,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                rating,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                description,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: _launchURL, // Respon ketika button ditekan
                child: Text("Lihat Aplikasi"),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
