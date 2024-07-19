import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:litura/common_widgets/custom_art_card.dart';
import 'package:litura/app.home/home_page.dart';

class ArtworkPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final double rating;

  const ArtworkPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              category,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text(
                  'Rating:',
                  style: TextStyle(fontSize: 18.0),
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
    );
  }
}
