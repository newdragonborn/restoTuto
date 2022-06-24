// import 'package:flutter/material.dart' show ChangeNotifier;
// import '../item.dart';

// class ItemManager extends ChangeNotifier {
//   static int count = 10;

//   final List<ItemMenu> _itemMenus = [
//     ItemMenu(1, true, "images/bh.jpeg", "Beignets Haricots",
//         ["8 Beignets", "haricots", "bouillit", "lait", "eau glace"], 1000),
//     ItemMenu(
//         2,
//         true,
//         "images/haricots.jpeg",
//         "Riz Haricots",
//         ["riz", "haricots", "2 plantain", "spaghetti", "friture", "eau glace"],
//         1500),
//     ItemMenu(3, true, "images/koki.jpeg", "Koki",
//         ["koki", "banane", "plantains", "patate", "eau glace"], 3000),
//     ItemMenu(4, true, "images/kondres.jpeg", "Kondres",
//         ["kondres", "chevres", "porc", "boeux", "eau glace"], 4000),
//     ItemMenu(5, true, "images/taro.jpeg", "taro",
//         ["taro", "canda", "porc", "boeux", "eau glace"], 5000),
//     ItemMenu(6, true, "images/eru.jpeg", "eru",
//         ["eru", "canda", "porc", "tapioca", "fufu", "eau glace"], 3000),
//     ItemMenu(7, true, "images/gombo.jpeg", "gombo",
//         ["gombo", "canda", "couscous", "eau glace"], 1500),
//     ItemMenu(8, true, "images/poulet.jpeg", "poulet",
//         ["rotir", "bresser", "frit", "plantain", "eau glace"], 2500),
//     ItemMenu(
//         9,
//         true,
//         "images/tilapia.jpeg",
//         "tilapia",
//         ["tilapia", "miondo", "plantain frite", "pomme frite", "eau glace"],
//         3500),
//     ItemMenu(
//         10,
//         true,
//         "images/dolep.jpeg",
//         "Ndole plantain",
//         [
//           "ndole",
//           "plantain",
//           "porc",
//           "pattes de boeuf",
//           "friture",
//           "eau glace"
//         ],
//         2000),
//   ];

//   List<ItemMenu> get allItemMenus => _itemMenus;
//   List<ItemMenu> get doneItemMenus =>
//       _itemMenus.where((itemMenu) => itemMenu.done).toList();

//   void addNew(String nom, List<String> composant, String placeimage, int prix) {
//     ItemMenu itemMenu =
//         ItemMenu(count + 1, true, placeimage, nom, composant, prix);
//     _itemMenus.add(itemMenu);
//     count++;
//     notifyListeners();
//   }

//   void toggle(ItemMenu itemMenu) {
//     int index = _itemMenus.indexOf(itemMenu);
//     _itemMenus[index].done = !itemMenu.done;
//     notifyListeners();
//   }

//   void delete(ItemMenu itemMenu) {
//     _itemMenus.remove(itemMenu);
//     notifyListeners();
//   }
// }
