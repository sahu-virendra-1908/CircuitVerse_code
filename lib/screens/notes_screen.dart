import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/note.dart';
import '../services/hive_service.dart';
import '../widgets/note_card.dart';
import 'add_note_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Note>('notesBox');

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
        backgroundColor: const Color.fromARGB(255, 2, 117, 73),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<Note> box, _) {
          final notes = HiveService.getNotes();

          if (notes.isEmpty) {
            return const Center(
              child: Text(
                "No Notes Yet\nTap + to add",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(top: 10, bottom: 80),
            itemCount: notes.length,
            itemBuilder: (_, index) {
              return NoteCard(
                note: notes[index],
                onDelete: () => HiveService.deleteNote(index),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        elevation: 4,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddNoteScreen()),
          );
        },
      ),
    );
  }
}