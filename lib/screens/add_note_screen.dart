import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/hive_service.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
        backgroundColor:const Color.fromARGB(255, 2, 117, 73)
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Title Field
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter title...",
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Content Field
            TextField(
              controller: contentController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Write your notes...",
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 2, 117, 73),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (titleController.text.isEmpty ||
                      contentController.text.isEmpty) return;

                  HiveService.addNote(
                    Note(
                      title: titleController.text,
                      content: contentController.text,
                      createdAt: DateTime.now(),
                    ),
                  );

                  Navigator.pop(context);
                },
                child: const Text(
                  "Save Note",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}