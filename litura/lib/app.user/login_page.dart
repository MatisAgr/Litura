import 'package:flutter/material.dart';
import 'package:litura/common_widgets/custom_text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email = '';

  void signIn() {
    if (_formKey.currentState!.validate()) {
      if (emailController.text == 'admin@admin.fr' &&
          passwordController.text == 'admin') {
        setState(() {
          email = emailController.text;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Bonjour, $email !"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Connexion échouée'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff806491),
          title: const Text(
            'Connexion',
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
          height: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    style: const TextStyle(
                      fontFamily: 'Numans',
                    ),
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrer un email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      fontFamily: 'Numans',
                    ),
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Mot de passe",
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrer un mot de passe';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextButton(
                    backgroundColor: const Color(0xff2f70AF),
                    txt: 'Connexion',
                    iconData: Icons.login,
                    onPressed: signIn,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
