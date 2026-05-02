import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class Livre {
  String titre;
  String auteur;

  Livre({required this.titre, required this.auteur});
}

// APP
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LivrePage(),
    );
  }
}

// PAGE PRINCIPALE
class LivrePage extends StatefulWidget {
  @override
  _LivrePageState createState() => _LivrePageState();
}

class _LivrePageState extends State<LivrePage> {
  List<Livre> livres = [];

  final titreController = TextEditingController();
  final auteurController = TextEditingController();

  int? indexEdit;

  // CREATE / UPDATE
  void ajouterOuModifier() {
    setState(() {
      if (indexEdit == null) {
        livres.add(Livre(
          titre: titreController.text,
          auteur: auteurController.text,
        ));
      } else {
        livres[indexEdit!] = Livre(
          titre: titreController.text,
          auteur: auteurController.text,
        );
        indexEdit = null;
      }

      titreController.clear();
      auteurController.clear();
    });
  }

  // DELETE
  void supprimer(int index) {
    setState(() {
      livres.removeAt(index);
    });
  }

  // EDIT
  void editer(int index) {
    setState(() {
      titreController.text = livres[index].titre;
      auteurController.text = livres[index].auteur;
      indexEdit = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRUD Livres')),

      body: Column(
        children: [
          // FORMULAIRE
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: titreController,
                  decoration: InputDecoration(labelText: "Titre"),
                ),
                TextField(
                  controller: auteurController,
                  decoration: InputDecoration(labelText: "Auteur"),
                ),
                ElevatedButton(
                  onPressed: ajouterOuModifier,
                  child: Text(indexEdit == null ? "Ajouter" : "Modifier"),
                ),
              ],
            ),
          ),

          // LISTe
          Expanded(
            child: ListView.builder(
              itemCount: livres.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(livres[index].titre),
                  subtitle: Text(livres[index].auteur),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => editer(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => supprimer(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}