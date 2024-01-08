
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quicknotes/controller/note_provider.dart';
import 'package:quicknotes/models/note.dart';
import 'package:quicknotes/views/shared/appstyle.dart';
import 'package:quicknotes/views/shared/customBtn.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {

  final int? index;
  AddPage({this.index});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  late String _currentDate;

  String _getCurrentDate(DateTime dateTime) {
    // Format the date as needed
    return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
  }

  @override
  void initState() {
    super.initState();
    // _titleController = TextEditingController();
    // _contentController = TextEditingController();
    _currentDate = _getCurrentDate(DateTime.now());
    if (widget.index != null) {
      _titleController = TextEditingController();
      _contentController = TextEditingController();
      _initTextControllers();
    } else {
      _titleController = TextEditingController();
      _contentController = TextEditingController();
    }


    // Initialize text controllers with existing note data if editing

  }


  //if old index does not match the updated index
   void _initTextControllers() {
     Note existingNote = Provider.of<NoteController>(context, listen: false).notes[widget.index!];
     _titleController.text = existingNote.title;
     _contentController.text = existingNote.content;
   }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 4,
        title: Text(widget.index == null ? 'Add Note' : 'Edit Note',style: appstyle(25, Colors.black, FontWeight.bold),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/stackedSteps.png"),
          fit: BoxFit.fill,
          alignment: Alignment.topLeft),

        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 25),
                    TextField(
                      controller: _titleController,
                      style: appstyle(25, Colors.black, FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: 'Title',
                        border: InputBorder.none,
                        hintStyle: appstyle(25, Colors.grey, FontWeight.bold),
                      ),
                      inputFormatters: [UpperCaseTextFormatter()],
                    ),
                    Text("$_currentDate",
                        style: appstyle(14, Colors.grey.shade700, FontWeight.normal)),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _contentController,
                      style: appstyle(16, Colors.black, FontWeight.w500),
                      decoration: InputDecoration(
                        hintText:
                        'Note something down or click on \nimage to upload image',
                        border: InputBorder.none,
                        hintStyle: appstyle(
                            14, Colors.grey.shade700, FontWeight.w500),
                      ),
                      inputFormatters: [UpperCaseTextFormatter()],
                      maxLines: null,
                    ),
                    const SizedBox(height: 100),
                    CustomBtn(
                      label: widget.index == null ? 'Add Note' : 'Edit Note',
                      onTap: () {
                        _saveNote();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Note _createorEditNote(){
    return Note(
      title: _titleController.text,
      content: _contentController.text,
      timestamp: DateTime.now(),
    );
  }

  void _saveNote() {
    if (widget.index == null) {
      Provider.of<NoteController>(context, listen: false).addNote(_createorEditNote());
    } else {
      Provider.of<NoteController>(context, listen: false).editNote(
          widget.index!, _createorEditNote());
    }
  }
}

//for First Letter UpperCase
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      return TextEditingValue(
        text: newValue.text[0].toUpperCase() + newValue.text.substring(1),
        selection: newValue.selection,
      );
    }
    return newValue;
  }
}
