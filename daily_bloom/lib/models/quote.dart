class Quote {
  String text;
  String author;
  String category;
  String status;

  Quote({
    required this.text,
    required this.author,
    required this.category,
    required this.status,
  });

  @override
  bool operator ==(Object other) {
    if (other is Quote) {
      return other.text == text && other.author == author;
    }

    return false;
  }

  @override
  int get hashCode {
    return text.hashCode ^ author.hashCode;
  }
}
