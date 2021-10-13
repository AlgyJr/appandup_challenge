class Book {
  Book(
      this.id,
      this.selfLink,
      this.title,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.mainCategory,
      this.categories,
      this.averageRating,
      this.ratingsCount,
      this.imageLinks,
      this.language,
      this.infoLink,
      this.canonicalVolumeLink,
      {this.isFavorite = false});

  final String id;
  final String selfLink;
  final String title;
  final List<dynamic> authors;
  final String publisher;
  final DateTime? publishedDate;
  final String description;
  final int pageCount;
  final String mainCategory;
  final List<dynamic> categories;
  final double averageRating;
  final int ratingsCount;
  final Map<String, dynamic> imageLinks;
  final String language;
  final String infoLink;
  final String canonicalVolumeLink;
  bool isFavorite;

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] as Map<String, dynamic>;
    return Book(
      json['id'] ?? "",
      json['selfLink'] ?? "",
      volumeInfo['title'] ?? "",
      volumeInfo['authors'] ?? [],
      volumeInfo['publisher'] ?? "",
      DateTime.tryParse(volumeInfo['publishedDate'] ?? ""),
      volumeInfo['description'] ?? "",
      volumeInfo['pageCount'] ?? 0,
      volumeInfo['mainCategory'] ?? "",
      volumeInfo['categories'] ?? [],
      (volumeInfo['averageRating'] ?? 0.0) * 1.0,
      volumeInfo['ratingsCount'] ?? 0,
      volumeInfo['imageLinks'] ?? {},
      volumeInfo['language'] ?? "",
      volumeInfo['infoLink'] ?? "",
      volumeInfo['canonicalVolumeLink'] ?? "",
    );
  }
}
