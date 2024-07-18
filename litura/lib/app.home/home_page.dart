import 'package:flutter/material.dart';
import 'package:litura/common_widgets/custom_book_card.dart';
import 'package:litura/api/api_get.dart';
import 'package:litura/api/api_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  late Future<List> topFiveData;
  @override
  void initState() {
    super.initState();
    topFiveData = Gets.getLoisirTopFive();
  }
 
  Widget build(BuildContext context) 
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
            FutureBuilder<List>(
              future: const topFiveData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!.map((data) => CustomBookCard(
                      imageUrl: data['loisir_image'],
                      title: data['loisir_nom'],
                      category: data['loisir_type'],
                      rating: data['loisir_note'],
                    )).toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }

