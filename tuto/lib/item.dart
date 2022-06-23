class ItemMenu {
  int id;
  bool done;
  String placeImage;
  String placeName;
  List<String> items;
  int prix;

  ItemMenu(this.id, this.done, this.placeImage, this.placeName, this.items,
      this.prix);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is ItemMenu && other.id == id;
}
