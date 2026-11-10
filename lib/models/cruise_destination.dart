// Data model representing cruise destination details
class CruiseDestination {
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final int initialRating;
  final List<String> packages;

  const CruiseDestination({
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.initialRating,
    required this.packages,
  });
}