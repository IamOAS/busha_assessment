/// This extension adds the ability to get the path of an asset file by just calling the name of the asset file.
extension AssetName on String {
  String get svg => 'assets/svgs/$this.svg';
  String get png => 'assets/pngs/$this.png';
}
