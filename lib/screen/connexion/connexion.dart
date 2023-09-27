import 'package:capteurapp/screen/Homepage/homepage.dart';
import 'package:capteurapp/service/CustomConnection.dart';
import 'package:capteurapp/service/CustomRouter.dart';
import 'package:flutter/material.dart';

class Connexion extends StatelessWidget {
  Connexion({Key? key}) : super(key: key);

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerEmail,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controllerPassword,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text("Connexion"),
              onPressed: () {
                final email = _controllerEmail.text;
                final password = _controllerPassword.text;

                if (email.isEmpty || password.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Champs vides"),
                        content: Text("Veuillez remplir tous les champs."),
                        actions: <Widget>[
                          TextButton(
                            child: Text("Fermer"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                CustomConnection.login(email: email, password: password)
                    .then((value) {
                  if (value == "OK") {
                    Navigator.pushNamed(context, CustomRouter.homepage);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Erreur de connexion"),
                          content: Text("Vérifiez vos informations de connexion."),
                          actions: <Widget>[
                            TextButton(
                              child: Text("Fermer"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
