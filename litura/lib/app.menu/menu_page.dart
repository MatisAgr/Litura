import 'package:flutter/material.dart';
import 'package:litura/app.add_art/add_art_page.dart';
import 'package:litura/app.delete_art/delete_art_page.dart';
import 'package:litura/app.search_book/search_page.dart';
import 'package:litura/app.user/menu_user_page.dart';
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
      body: Container(
        color: Colors.black,
        child: Padding(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()));
                },
                icon: Icons.arrow_forward_ios,
              ),
              const SizedBox(height: 24.0),
              CustomButton(
                text: 'Ajouter',
                textColor: Colors.white,
                color: const Color(0xff806491),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddArtPage()));
                },
                icon: Icons.arrow_forward_ios,
              ),
              const SizedBox(height: 24.0),
              CustomButton(
                text: 'Supprimer',
                textColor: Colors.white,
                color: const Color(0xff806491),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeleteArtPage()));
                },
                icon: Icons.arrow_forward_ios,
              ),
              const SizedBox(height: 24.0),
              CustomButton(
                text: 'Compte',
                textColor: Colors.white,
                color: const Color(0xff806491),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuUserPage()));
                },
                icon: Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
