import 'package:flutter/material.dart';
import 'package:litura/common_widgets/custom_text_button.dart';
import 'package:litura/app.artwork/artwork_page.dart';
import 'package:intl/intl.dart';

class CustomArtCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final String description;  
  final double rating;
  final String date;

  const CustomArtCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.category,
      required this.description,
      required this.rating,
      required this.date, 
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
                    Text(
                      "date : ${DateFormat('yyyy-MM-dd').format(DateTime.parse(date))}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'Numans',
                      ),
                    ),
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
                        CustomTextButton(
                          backgroundColor: const Color(0xff2f70AF),
                          txt: 'Voir',
                          iconData: Icons.remove_red_eye,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArtworkPage(
                                  imageUrl: imageUrl,
                                  title: title,
                                  category: category,
                                  description: description,
                                  rating: rating,
                                ),
                              ),
                            );
                          },
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
