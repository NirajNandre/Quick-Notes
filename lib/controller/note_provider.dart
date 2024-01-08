import 'package:flutter/material.dart';
import 'package:quicknotes/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NoteController extends ChangeNotifier {
  List<Note> notes = [];


  NoteController() {
    // Initialize notes from local storage
    _loadNotes();
  }

  // Add a new note
  void addNote(Note newNote) {
    notes.insert(0, newNote);
    _saveNotes();
    notifyListeners();
  }

  // Edit an existing note
  void editNote(int index, Note updatedNote) {
    notes[index] = updatedNote;
    _saveNotes();
    notifyListeners();
  }

  // Delete a note
  void deleteNote(int index) {
    notes.removeAt(index);
    _saveNotes();
    notifyListeners();
  }

  // Load notes from local storage
  void _loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var storedNotes = prefs.getStringList('notes');
    if (storedNotes != null) {
      notes = storedNotes.map((note) => Note.fromJson(json.decode(note))).toList();
      notifyListeners();
    }
  }

  // Save notes to local storage
  void _saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedNotes = notes.map((note) => json.encode(note.toJson())).toList();
    prefs.setStringList('notes', encodedNotes);
  }
}
