enum Taste {
  sweet("Sweet", "Sweet"),
  sour("Sour", "Sour"),
  sweetAndSour("Sweet and sour", "Sweet and sour"),
  salty("Salty", "Salty"),
  bitter("Bitter", "Bitter");

  const Taste(this.value, this.showed);

  final String value;
  final String showed;
}
