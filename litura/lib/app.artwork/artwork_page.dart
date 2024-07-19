import 'package:flutter/material.dart';

class ArtworkPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final String description;
  final double rating;

  const ArtworkPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff806491),
        title: const Text(
          'L\'Oeuvre',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.0,
            fontFamily: 'FiraSans',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF2f70AF),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                category,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Rating:',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.amber,
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
