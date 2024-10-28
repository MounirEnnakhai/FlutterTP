import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduitBox extends StatelessWidget {
  final String nomProduit;
  final bool selProduit;
  final Function(bool?)? onChanged;
  final Function()? delProduit;

  ProduitBox({
    required this.nomProduit,
    required this.selProduit,
    required this.onChanged,
    required this.delProduit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => delProduit?.call(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Supprimer',
            ),
          ],
        ),
        child: Container(
          height: 80,  // Ajustez la hauteur si nécessaire
          decoration: BoxDecoration(
            color: Colors.yellow,  // Fond jaune
            borderRadius: BorderRadius.circular(20),  // Bordure arrondie
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  nomProduit,
                  style: TextStyle(
                    fontSize: 18,  // Ajustez la taille de la police si nécessaire
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Checkbox(
                value: selProduit,
                onChanged: onChanged,
                activeColor: const Color.fromARGB(255, 25, 37, 209),  // Couleur de la case à cocher lorsqu'elle est cochée
              ),
            ],
          ),
        ),
      ),
    );
  }
}
