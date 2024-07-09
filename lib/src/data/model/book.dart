class Book {
  final int id;
  final String title;
  final String author;
  final String imageUrl;

  Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.imageUrl});
  factory Book.fromJson(Map<String, dynamic> data) {
    return Book(
      id: data['id'],
      title: data['title'],
      author: data['author'],
      imageUrl: data['image_url'],
    );
  }
}
