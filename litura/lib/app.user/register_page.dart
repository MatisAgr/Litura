import 'package:flutter/material.dart';
import 'package:litura/app.search_book/search_page.dart';
import 'package:litura/api/api_post.dart';
import 'package:litura/common_widgets/custom_text_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String nom = '';
  String prenom = '';
  String email = '';
  String password = '';

  Future<void> registerIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        email = emailController.text;
        nom = nomController.text;
        prenom = prenomController.text;
        password = passwordController.text;
      });

      try {
        Map<String, dynamic> user =
            await Posts.createUser(nom, prenom, email, password, 'user');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Utilisateur créé avec succès : ${user.toString()}"),
          ),
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchPage()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Erreur lors de la création de l'utilisateur : $e"),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Inscription échouée'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff806491),
          title: const Text(
            'Inscription',
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
                    controller: nomController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff806491),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, // Couleur des bords par défaut
                          width: 1.0,
                        ),
                      ),
                      hintText: "Nom",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrer un nom';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: const TextStyle(
                      fontFamily: 'Numans',
                    ),
                    controller: prenomController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff806491),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey, // Couleur des bords par défaut
                          width: 1.0,
                        ),
                      ),
                      hintText: "Prénom",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrer un prénom';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: const TextStyle(
                      fontFamily: 'Numans',
                    ),
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff806491),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      hintText: "Email",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrer un email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    style: const TextStyle(
                      fontFamily: 'Numans',
                    ),
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff806491),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      hintText: "Mot de passe",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez rentrer un mot de passe';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextButton(
                    backgroundColor: const Color(0xff2f70AF),
                    txt: 'Inscription',
                    iconData: Icons.login,
                    onPressed: registerIn,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
