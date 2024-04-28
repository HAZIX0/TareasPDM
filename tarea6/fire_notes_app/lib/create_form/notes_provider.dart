import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class NotesProvider with ChangeNotifier {
  bool isLoading = false;
  File? _selectedPicture;
  File? get getSelectedImage => _selectedPicture;
  Future<void> getAllNotes() async {}
  Future<bool> createNewNote(Map<String, dynamic> noteContent) async {
    try {
      isLoading = true;
      notifyListeners();
      // uploadPictureToStorage
      String _imageUrl = await _uploadPictureToStorage();
      if (_imageUrl != "") {
        noteContent["data"]["images"] = [_imageUrl];
      }
      await FirebaseFirestore.instance.collection("notes").add(noteContent);
      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      print("Error: ${e.toString()}");
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> editExistingNote(String noteReference) async {}

  Future<bool> removeExistingNote(String noteReference) async {
    print("entre");
    try {
      isLoading = true;
      notifyListeners();

      await FirebaseFirestore.instance
          .collection("notes")
          .doc(noteReference)
          .delete()
          .then((value) => print("Note Deleted"))
          .catchError((error) => print("Failed to delete note: $error"));
      ;

      isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      print("Error removing note: ${e.toString()}");
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<String> _uploadPictureToStorage() async {
    // implementar logica para guardar imagen en storage y obtener su url
    try {
      if (_selectedPicture == null) return "";
      // definir upload task
      var stamp = DateTime.now();
      UploadTask task = FirebaseStorage.instance
          .ref("notas/imagen_${stamp}.png")
          .putFile(_selectedPicture!);
      // ejecutar task
      await task;
      // recuperar la url
      return await task.storage
          .ref("notas/imagen_${stamp}.png")
          .getDownloadURL();
    } catch (e) {
      print("Error al subir archivo a storage: ${e.toString()}");
      return "";
    }
  }

  Future<void> takePicture() async {
    // implementar logica para tomar foto con la camara
    isLoading = true;
    notifyListeners();
    await _getImage();
    isLoading = false;
    notifyListeners();
  }

  Future<void> _getImage() async {
    // implementar logica para generar file con la foto tomada
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      _selectedPicture = File(pickedFile.path);
    } else {
      print("No image selected");
      _selectedPicture = null;
    }
  }
}
