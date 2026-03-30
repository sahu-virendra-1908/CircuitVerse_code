import 'package:hive/hive.dart';
import '../models/note.dart';

class HiveService {
  static final box = Hive.box<Note>('notesBox');

  static List<Note> getNotes() => box.values.toList();

  static void addNote(Note note) => box.add(note);

  static void deleteNote(int index) => box.deleteAt(index);
}