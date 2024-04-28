import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fire_notes_app/create_form/notes_provider.dart';

class EditNoteForm extends StatefulWidget {
  final Map<String, dynamic> noteContent;
  final String noteId;

  const EditNoteForm(
      {Key? key, required this.noteContent, required this.noteId})
      : super(key: key);

  @override
  _EditNoteFormState createState() => _EditNoteFormState();
}

class _EditNoteFormState extends State<EditNoteForm> {
  final _titleController = TextEditingController();
  final _detailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.noteContent["data"]["title"];
    _detailsController.text = widget.noteContent["data"]["details"];
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Nota'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _detailsController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                final updatedNoteContent = {
                  "data": {
                    "title": _titleController.text,
                    "details": _detailsController.text,
                  }
                };

                final notesProvider =
                    Provider.of<NotesProvider>(context, listen: false);
                await notesProvider
                    .editExistingNote(widget.noteId, updatedNoteContent)
                    .then((success) {
                  if (success) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text("Actualizada con éxito"),
                        ),
                      );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text("No se pudo actualizar"),
                        ),
                      );
                  }
                });
                ;
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
