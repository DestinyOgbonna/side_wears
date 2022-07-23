extension AssetName on String {
  String get svg => 'assets/svg/$this.svg';
  String get images => 'assets/images/$this.png';
  String get png => 'assets/icons/$this.png';
}
