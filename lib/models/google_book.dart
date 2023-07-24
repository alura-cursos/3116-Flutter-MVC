class GoogleBook {
  late String id;
  late String title;
  late String authors;
  late String description;
  late String thumbnailLink;

  GoogleBook({
    required this.id,
    required this.title,
    required this.authors,
    required this.description,
    required this.thumbnailLink,
  });

  GoogleBook.fromApi(Map<String, dynamic> map) {
    id = map["id"];
    title = validateTitle(map);
    authors = validateAuthors(map);
    description = validateDescription(map);
    thumbnailLink = validateThumbnail(map);
  }

  validateThumbnail(Map<String, dynamic> map) => map["volumeInfo"]["imageLinks"]?["thumbnail"] == null ? "https://placehold.co/200x290.png" : map["volumeInfo"]["imageLinks"]?["thumbnail"];

  validateDescription(Map<String, dynamic> map) => map["volumeInfo"]["description"] == null ? "Sem descrição" : map["volumeInfo"]["description"];

  String validateAuthors(Map<String, dynamic> map) => map["volumeInfo"]["authors"] == null ? "Autor desconhecido" : (map["volumeInfo"]["authors"] as List<dynamic>).map((e) => e).toString();

  validateTitle(Map<String, dynamic> map) => map["volumeInfo"]["title"] == null ? "Título desconhecido" : map["volumeInfo"]["title"];

  GoogleBook.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    authors = map["authors"];
    description = map["description"];
    thumbnailLink = map["thumbnailLink"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "authors": authors,
      "description": description,
      "thumbnailLink": thumbnailLink,
    };
  }
}
