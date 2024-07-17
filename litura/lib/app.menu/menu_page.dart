import 'package:flutter/material.dart';
import 'package:litura/common_widgets/custom_button.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff806491),
        title: const Text(
          'Menu',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.0,
            fontFamily: 'FiraSans',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 100.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomButton(
              text: 'Tous',
              textColor: Colors.white,
              color: const Color(0xff806491),
              onPressed: () {
              },
              icon: Icons.arrow_forward_ios,
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              text: 'Ajouter',
              textColor: Colors.white,
              color: const Color(0xff806491),
              onPressed: () {
              },
              icon: Icons.arrow_forward_ios,
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              text: 'Supprimer',
              textColor: Colors.white,
              color: const Color(0xff806491),
              onPressed: () {
              },
              icon: Icons.arrow_forward_ios,
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              text: 'Paramètre',
              textColor: Colors.white,
              color: const Color(0xff806491),
              onPressed: () {
              },
              icon: Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
