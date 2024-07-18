import 'package:flutter/material.dart';
import 'package:litura/app.artwork/artwork_page.dart';

class CustomBookCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final double rating;

  const CustomBookCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffb9848c),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imageUrl,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'FiraSans',
                      ),
                    ),
                    Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'FiraSans',
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Note: $rating',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontFamily: 'FiraSans',
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff2f70af),
                            minimumSize: const Size(110.0, 40.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: const BorderSide(color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArtworkPage(
                                  imageUrl: imageUrl,
                                  title: title,
                                  category: category,
                                  rating: rating,
                                ),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Voir',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Numans',
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.visibility,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
