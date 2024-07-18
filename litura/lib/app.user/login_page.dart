import 'package:flutter/material.dart';

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
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
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Mot de passe",
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
                ElevatedButton(
                  onPressed: () {
                    signIn();
                  },
                  child: const Text('Se connecter'),
                ),
              ],
            ),
          ),
        ));
  }
}
