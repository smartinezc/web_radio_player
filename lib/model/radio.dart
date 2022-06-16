
class RadioModel {
  final String id;
  final String name;
  final double frequency;
  final String image;
  final List<String> socials;
  final String audioStream;
  bool isFavorite;

  RadioModel(
    {
      required this.id,
      required this.name,
      required this.frequency,
      required this.image,
      required this.socials,
      required this.audioStream,
      this.isFavorite = false,
    }
  );

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

}