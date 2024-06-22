import 'package:get/get.dart';
import 'package:my_notes_todo_app/models/note_model.dart';

class NotesController extends GetxController {
  RxList<NoteModel> notes = <NoteModel>[].obs;

  addNotes(NoteModel noteData) {
    notes.add(noteData);
    update();
  }

  updateNotes(int index, NoteModel noteData) {
    notes[index] = (noteData);
    update();
  }

  deleteNotes(int index) {
    notes.removeAt(index);
    update();
  }
}
