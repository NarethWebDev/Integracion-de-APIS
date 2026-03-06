class DisneyContent {
  final String id;
  final String title;
  final String year;
  final String poster;
  final String type; 
  final String description;
  final List<String> genres;
  final double rating;
  final String director;

  DisneyContent({
    required this.id,
    required this.title,
    required this.year,
    required this.poster,
    required this.type,
    required this.description,
    required this.genres,
    required this.rating,
    required this.director,
  });

  factory DisneyContent.fromJson(Map<String, dynamic> json) {
    return DisneyContent(
      id: json['id'] ?? '',
      title: json['title'] ?? 'Unknown',
      year: json['year'] ?? 'N/A',
      poster: json['poster'] ?? '',
      type: json['type'] ?? 'movie',
      description: json['description'] ?? '',
      genres: List<String>.from(json['genres'] ?? []),
      rating: (json['rating'] ?? 0).toDouble(),
      director: json['director'] ?? 'Unknown',
    );
  }
}

class ContentFilter {
  final String name;
  final String value;
  final bool isSelected;

  ContentFilter({
    required this.name,
    required this.value,
    this.isSelected = false,
  });

  ContentFilter copyWith({bool? isSelected}) {
    return ContentFilter(
      name: name,
      value: value,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}