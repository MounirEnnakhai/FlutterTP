import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'add_produit.dart';

class ProduitsList extends StatefulWidget {
  @override
  _ProduitsListeState createState() => _ProduitsListeState();
}

class _ProduitsListeState extends State<ProduitsList> {
  List<String> produits = ['1 Produit', '2 Produit', '3 Produit', '4 Produit', '5 Produit'];
  List<bool> selProduits = [false, false, false, false, false];

  Future<void> _addProduit() async {
    TextEditingController controller = TextEditingController();

    final newProduit = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AddProduit(controller: controller);
      },
    );

    if (newProduit != null && newProduit.isNotEmpty) {
      setState(() {
        produits.add(newProduit);
        selProduits.add(false);
      });
    }
  }

  void delProduit(int index) {
    setState(() {
      produits.removeAt(index);
      selProduits.removeAt(index);
    });
  }

  void _onChanged(int index, bool? value) {
    setState(() {
      selProduits[index] = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produits'),
      ),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          return ProduitBox(
            nomProduit: produits[index],
            selProduit: selProduits[index],
            onChanged: (value) => _onChanged(index, value),
            delProduit: () => delProduit(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduit,
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
