class Book {
  final String slug;
  final String title;
  final String author;
  final String imageUrl;

  Book(
      {required this.slug,
      required this.title,
      required this.author,
      required this.imageUrl});
  factory Book.fromJson(Map<String, dynamic> data) {
    return Book(
      //since there is no id for each book
      //book is identified by its slug as following
      slug: data['title'].toString().replaceAll(" ", "-").toLowerCase(),
      title: data['titl'],
      author: data['author'],
      imageUrl: data['image_url'],
    );
  }
}
