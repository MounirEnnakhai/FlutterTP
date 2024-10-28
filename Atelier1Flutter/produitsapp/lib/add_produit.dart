import 'package:flutter/material.dart';

class AddProduit extends StatelessWidget {
  final TextEditingController controller;

  AddProduit({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ajouter un produit'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Nom du produit'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Ferme la boîte de dialogue
          },
          child: Text('Annuler'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(controller.text); // Retourne le nom du produit saisi
          },
          child: Text('Ajouter'),
        ),
      ],
    );
  }
}
