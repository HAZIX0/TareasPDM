import 'package:fire_notes_app/create_form/edit_note_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../create_form/notes_provider.dart';

class ItemNote extends StatelessWidget {
  final Map<String, dynamic> noteContent;
  final String noteId; // Añadir el ID del documento
  ItemNote({Key? key, required this.noteContent, required this.noteId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(builder: (context, notesProvider, child) {
      return Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          // color: noteContent["color"],
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteContent["data"]["title"],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => EditNoteForm(
                            noteContent: noteContent, noteId: noteId),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await notesProvider
                        .removeExistingNote(noteId)
                        .then((success) {
                      if (success) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Eliminado con éxito"),
                            ),
                          );
                      } else {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("No se pudo eliminar"),
                            ),
                          );
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
