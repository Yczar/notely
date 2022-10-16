import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/note.dart';

class NotesProvider extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => _notes;

  StreamSubscription? _notesSubscription;

  Future<void> subscribeToNotes() async {
    // user/{uid}/notes
    final userId = FirebaseAuth.instance.currentUser?.uid;
    // final getSnapshot = await FirebaseFirestore.instance
    //     .collection('user')
    //     .doc(userId)
    //     .collection('notes')
    //     .get();

    // log(getSnapshot.docs.toString());

    _notesSubscription = FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes')
        // .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((snapshot) {
      _notes.clear();
      for (var doc in snapshot.docs) {
        final note = Note.fromMap(
          doc.data(),
        );
        _notes.add(
          note,
        );
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _notesSubscription?.cancel();
    super.dispose();
  }
}
// users/uid/notes


// users/uid/reminders