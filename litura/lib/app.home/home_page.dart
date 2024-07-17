import 'package:flutter/material.dart';
import 'package:litura/common_widgets/custom_book_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff806491),
        title: const Text(
          'Litura',
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
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        color: const Color(0xFF2f70AF),
        child: ListView(
          children: const <Widget>[
            Column(
              children: [
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    'Top 5 des oeuvres',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            CustomBookCard(
              imageUrl: 'https://m.media-amazon.com/images/I/710wth0vXZL._AC_UF1000,1000_QL80_.jpg',
              title: 'Le Petit Prince',
              category: 'Roman',
              rating: 4.5,
            ),
          ],
        ),
      ),
    );
  }
}