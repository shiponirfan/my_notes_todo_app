class NoteModel {
  final String title;
  final String description;
  final DateTime createdDate;
  final DateTime? updatedDate;

  NoteModel({
    required this.title,
    required this.description,
    required this.createdDate,
    this.updatedDate,
  });
}
