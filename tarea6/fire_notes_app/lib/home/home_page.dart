import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_notes_app/content/fs_admin_table.dart';
import 'package:fire_notes_app/content/notes/item_note.dart';
import 'package:fire_notes_app/create_form/new_note_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class HomePage extends StatelessWidget {
  final _fabKey = GlobalKey<ExpandableFabState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => FsAdminTable(),
                ),
              );
            },
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
      body: FirestoreListView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        pageSize: 15,
        query: FirebaseFirestore.instance
            .collection("notes")
            .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid),
        itemBuilder: (BuildContext context,
            QueryDocumentSnapshot<Map<String, dynamic>> document) {
          return ItemNote(
            noteContent: document.data(),
            noteId: document.id,
          );
        },
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _fabKey,
        // type: ExpandableFabType.up,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            tooltip: "New note",
            child: Icon(Icons.file_copy),
            onPressed: () {
              print("New note button");
              _fabKey.currentState?.toggle();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => NewNoteForm(),
                ),
              );
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            tooltip: "New folder",
            child: Icon(Icons.folder),
            onPressed: () {
              _fabKey.currentState?.toggle();
            },
          ),
        ],
      ),
    );
  }
}
