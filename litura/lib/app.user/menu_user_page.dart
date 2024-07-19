import 'package:flutter/material.dart';
import 'package:litura/app.user/login_page.dart';
import 'package:litura/app.user/register_page.dart';
import 'package:litura/common_widgets/custom_button.dart';

class MenuUserPage extends StatelessWidget {
  const MenuUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff806491),
        title: const Text(
          'Compte',
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
                text: 'Connexion [NOP]',
                textColor: Colors.white,
                color: const Color(0xff806491),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                icon: Icons.arrow_forward_ios,
              ),
              const SizedBox(height: 24.0),
              CustomButton(
                text: 'Incription',
                textColor: Colors.white,
                color: const Color(0xff806491),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
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
