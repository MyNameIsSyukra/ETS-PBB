final String tableMovies = 'movies';

class MovieFields{
  static final List<String> values = [
    id, title, director, description
  ];
  static final String id = '_id';
  static final String title = 'title';
  static final String director = 'director';
  static final String description = 'description';
}

class Movie{
  final int id;
  final String title;
  final String director;
  final String description;

  const Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.description,
  });
  Movie copy({
    int? id,
    String? title,
    String? director,
    String? description,
  }) =>
      Movie(
        id: id ?? this.id,
        title: title ?? this.title,
        director: director ?? this.director,
        description: description ?? this.description,
      );

  static Movie fromJson(Map<String, Object?> json) => Movie(
    id: json['id'] as int,
    title: json['title'] as String,
    director: json['director'] as String,
    description: json['description'] as String,
  );

  Map<String, Object?> toJson() => {
    'id': id,
    'title': title,
    'director': director,
    'description': description,
  };
}